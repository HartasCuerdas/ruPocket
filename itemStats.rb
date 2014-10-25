require './item.rb'

class ItemStats

  def initialize(taggedItems, untaggedItems)
    @taggedItems = taggedItems
    @untaggedItems = untaggedItems
  end

  def print
    printGeneralStats
  end

  def printGeneralStats
    tagged = @taggedItems.length
    untagged = @untaggedItems.length
    puts '===================='
    puts '   General Stats    '
    puts '--------------------'
    puts sprintf "%-15s %2d", 'Tagged items:', tagged
    puts sprintf "%-15s %2d", 'Untagged items:', untagged
    puts '--------------------'
  end

end