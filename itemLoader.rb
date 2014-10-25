require 'item'

class ItemLoader

  def initialize(list)
    @taggedItems = []
    @untaggedItems = []
    load(list)
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
        @taggedItems.push(oItem)
      else
        @untaggedItems.push(oItem)
      end

    end

  end

  def getTaggedItems
    @taggedItems
  end

  def getUntaggedItems
    @untaggedItems
  end

end