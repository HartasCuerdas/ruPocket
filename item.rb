class Item
  def initialize
    @givenTitle = ''
    @givenURL = ''
    @tags = []
    @status = 0
  end
  def print
    puts 'Given title: ' + @givenTitle
    puts 'Given URL: ' + @givenURL
    puts 'Tags: ' + @tags.to_s
  end
  def setGivenTitle(givenTitle)
    @givenTitle = givenTitle
  end
  def setGivenURL(givenUrl)
    @givenUrl = givenUrl
  end
  def setTags(tags)
    @tags = tags
  end
  def setStatus(status)
    @status = status
  end
  def getGivenTitle
    @givenTitle
  end
  def getGivenUrl
    @givenUrl
  end
  def getTags
    @tags
  end
  def getStatus
    @status
  end
end