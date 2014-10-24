require './item.rb'

class Tags

  def initialize(items)
    @tags = Hash.new
    for item in items
      tags = item.getTags
      if !tags.empty?
        for tag in tags
          addTag(tag)
        end
      end
    end
  end

  def print
    @tags.sort_by {|_key, value| value}
    puts ''
    puts '==========='
    puts ' Tag Stats'
    puts '==========='
    @tags.each do |tag, count|
      puts "#{tag}: #{count}"
    end
    puts '==========='
    puts ''
  end

  def addTag(tag)
    if @tags.has_key?(tag)
      @tags[tag] += 1
    else
      @tags[tag] = 1
    end
  end
  
end