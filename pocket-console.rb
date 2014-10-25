require './tags.rb'
require './itemStats.rb'
require './tagStats.rb'

class PocketConsole
  
  def initialize(taggedItems, untaggedItems)
    @taggedItems = taggedItems
    @untaggedItems = untaggedItems
    @tags = Tags.new(taggedItems)
  end

  def print
    puts ''
    printGeneralStats
    puts ''
    printTagStats
    puts ''
  end

  def printGeneralStats
    itemStats = ItemStats.new(@taggedItems, @untaggedItems)
    itemStats.print
  end

  def printTagStats
    tagStats = TagStats.new(@tags)
    tagStats.print
  end

end