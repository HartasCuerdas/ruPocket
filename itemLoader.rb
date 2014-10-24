require './item.rb'
require 'httparty'
require 'json'

class ItemLoader

  def initialize
    @items = []
  end

  def load
    item1tags = ['dev','rails']
    item1 = Item.new('hola', item1tags)
    @items.push(item1)

    item2tags = ['new','dev']
    item2 = Item.new('uhm', item2tags)
    @items.push(item2)

    @items
  end

end