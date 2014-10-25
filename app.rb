# This code is based on pocket-ruby
# https://github.com/turadg/pocket-ruby

require 'sinatra'

require 'yaml'
require 'pocket.rb'

require './itemLoader.rb'
require './pocket-console.rb'

enable :sessions

CALLBACK_URL = "http://localhost:4567/oauth/callback"

Pocket.configure do |config|
  config.consumer_key = 'YOUR-CONSUMER_KEY'
end

get '/tags' do
  client = Pocket.client(:access_token => session[:access_token])
  info = client.retrieve(:detailType => :complete, :count => 80, :state => :all)
  File.open('./.cache-files/info.yml', 'w') {|f| f.write(YAML.dump(info)) }
  tags(info)
end

get '/tags-cache' do
  info = YAML.load(File.read('./.cache-files/info.yml'))
  tags(info)
end

def tags(info)
  list = info['list']

  itemLoader = ItemLoader.new(list)
  taggedItems = itemLoader.getTaggedItems
  untaggedItems = itemLoader.getUntaggedItems

  pocketConsole = PocketConsole.new(taggedItems, untaggedItems)
  pocketConsole.print

  "Stats are in the console"
end

# All the code below belongs to pocket-ruby
# https://github.com/turadg/pocket-ruby

get '/reset' do
  puts "GET /reset"
  session.clear
end

get "/" do
  puts "GET /"
  puts "session: #{session}"

  if session[:access_token]
    '
<a href="/add?url=http://getpocket.com">Add Pocket Homepage</a>
<a href="/retrieve">Retrieve single item</a>
    '
  else
    '<a href="/oauth/connect">Connect with Pocket</a>'
  end
end

get "/oauth/connect" do
  puts "OAUTH CONNECT"
  session[:code] = Pocket.get_code(:redirect_uri => CALLBACK_URL)
  new_url = Pocket.authorize_url(:code => session[:code], :redirect_uri => CALLBACK_URL)
  puts "new_url: #{new_url}"
  puts "session: #{session}"
  redirect new_url
end

get "/oauth/callback" do
  puts "OAUTH CALLBACK"
  puts "request.url: #{request.url}"
  puts "request.body: #{request.body.read}"
  result = Pocket.get_result(session[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = result['access_token']
  puts result['access_token']
  puts result['username'] 
  # Alternative method to get the access token directly
  #session[:access_token] = Pocket.get_access_token(session[:code])
  puts session[:access_token]
  puts "session: #{session}"
  redirect "/"
end

get '/add' do
  client = Pocket.client(:access_token => session[:access_token])
  info = client.add :url => 'http://getpocket.com'
  "<pre>#{info}</pre>"
end

get "/retrieve" do
  client = Pocket.client(:access_token => session[:access_token])
  info = client.retrieve(:detailType => :complete, :count => 20)

  # html = "<h1>#{user.username}'s recent photos</h1>"
  # for media_item in client.user_recent_media
  #   html << "<img src='#{media_item.images.thumbnail.url}'>"
  # end
  # html

  "<pre>#{info}</pre>"
end