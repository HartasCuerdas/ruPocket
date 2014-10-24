class Item
  def initialize
    @givenTitle = ''
    @givenURL = ''
    @tags = []
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
  def getGivenTitle
    @givenTitle
  end
  def getGivenUrl
    @givenUrl
  end
  def getTags
    @tags
  end
end