require './item.rb'

class Tags

  def initialize(items)
    @tags = Hash.new
    for item in items
      tags = item.getTags
      status = item.getStatus
      for tag in tags
        addTag(tag, status)
      end
    end
  end

  def addTag(tag, status)
    
    #status 0: default
    #status 1: archived
    if (status == '1')
      archived = 1
    else
      archived = 0
    end

    if @tags.has_key?(tag)
      @tags[tag]['count'] = @tags[tag]['count'] + 1
      @tags[tag]['archived'] = @tags[tag]['archived'] + archived
      @tags[tag]['unread'] = @tags[tag]['count'] - @tags[tag]['archived']
    else
      @tags[tag] = Hash.new
      @tags[tag]['count'] = 1
      @tags[tag]['archived'] = archived
      @tags[tag]['unread'] = 1 - archived
    end

  end
  
  def getTags
    @tags
  end

end