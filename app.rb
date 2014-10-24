require './itemLoader.rb'
require './tags.rb'

puts 'rPocket'

itemLoader = ItemLoader.new
items = itemLoader.load

tags = Tags.new(items)
tags.print