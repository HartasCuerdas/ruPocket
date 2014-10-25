require './item.rb'

class ItemPrinter

  def initialize(items)
    @items = items
  end

  def printItems
    puts ''
    puts '==========='
    puts ' Items '
    puts '-----------'
    puts 'status | title'
    for item in @items
      given_title = item.getGivenTitle
      status = item.getStatus
      tags = item.getTags
      if !tags.empty?
        puts "#{status} | #{tags} #{given_title}"
      else
        puts "#{status} | #{given_title}"
      end
    end
    puts '==========='
    puts ''
  end

end