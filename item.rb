class Item  
  def initialize(title, tags)
    @title = title
    @tags = tags
  end
  def print
    puts 'title: ' + @title
    puts 'tags: ' + @tags.to_s
  end
  def getTags
    @tags
  end
end