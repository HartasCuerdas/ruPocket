require './item.rb'

class Tags

  def initialize(items)
    @tags = Hash.new
    for item in items
      for tag in item.getTags
        addTag(tag)
      end
    end
  end

  def print
    @tags.each do |tag, count|
      puts "#{tag}: #{count}"
    end
  end

  def addTag(tag)
    if @tags.has_key?(tag)
      @tags[tag] += 1
    else
      @tags[tag] = 1
    end
  end
  
end