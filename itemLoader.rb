require './item.rb'

class ItemLoader

  def initialize
    @items = []
  end

  def load(list)

    for item in list

      info = item[1]
      oItem = Item.new
      
      given_title = info['given_title']
      oItem.setGivenTitle(given_title)

      given_url = info['given_url']
      oItem.setGivenURL(given_url)

      if info.has_key?('tags')
        tags = []
        info_tags = info['tags']
        for tag in info_tags
          str_tag = tag[1]['tag']
          tags.push(str_tag)
        end
        oItem.setTags(tags)
      end

      @items.push(oItem)

    end

    @items

  end

end