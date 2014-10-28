require 'item'

class ItemLoader

  def initialize(list)
    @taggedItems = []
    @untaggedItems = []
    @unreadTaggedItems = 0
    @unreadUntaggedItems = 0
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
        if (status == '0')
          @unreadTaggedItems += 1
        end
      else
        @untaggedItems.push(oItem)
        if (status == '0')
          @unreadUntaggedItems += 1
        end
      end

    end

  end

  def getTaggedItems
    @taggedItems
  end

  def getUntaggedItems
    @untaggedItems
  end

  def getUnreadTaggedItems
    @unreadTaggedItems
  end

  def getUnreadUntaggedItems
    @unreadUntaggedItems
  end

  def getReadTaggedItems
    @taggedItems.length - @unreadTaggedItems
  end

  def getReadUntaggedItems
    @untaggedItems.length - @unreadUntaggedItems
  end

end