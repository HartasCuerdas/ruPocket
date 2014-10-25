require './item.rb'

class ItemLoader

  def initialize
    @items = []
    @untaggedItems =[]
  end

  def load(list)

    for item in list

      info = item[1]
      oItem = Item.new
      
      given_title = info['given_title']
      oItem.setGivenTitle(given_title)

      given_url = info['given_url']
      oItem.setGivenURL(given_url)

      status = info['status']
      oItem.setStatus(status)

      if info.has_key?('tags')
        tags = []
        info_tags = info['tags']
        for tag in info_tags
          str_tag = tag[1]['tag']
          tags.push(str_tag)
        end
        oItem.setTags(tags)
        @items.push(oItem)
      else
        @untaggedItems.push(oItem)
      end

    end

    @items

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

  def printUntaggedStats
    tagged = @items.length
    untagged = @untaggedItems.length
    puts '===================='
    puts '   General Stats    '
    puts '--------------------'
    puts sprintf "%-15s %2d", 'Tagged items:', tagged
    puts sprintf "%-15s %2d", 'Untagged items:', untagged
    puts '--------------------'
  end

end