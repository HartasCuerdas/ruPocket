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

  def print
    printMostUsed
    printMostUnread
  end

  def printMostUsed
    @tags = @tags.sort_by{|_key, stats| stats['count']}.reverse!
    puts ''
    puts '================================'
    puts '     Tag Stats - Most Used      '
    puts '--------------------------------'
    puts sprintf "%-12s | %6s  | %7s", 'tag', 'total', 'unread'
    @tags.each do |tag, stats|
      count = stats['count']
      if count == 1
        break
      end
      unread = stats['unread']
      puts sprintf "%-12s | %6d  | %7d", tag, count, unread
    end
    puts '================================'
  end

  def printMostUnread
    @tags = @tags.sort_by{|_key, stats| stats['unread']}.reverse!
    puts ''
    puts '================================'
    puts '     Tag Stats - Most Unread    '
    puts '--------------------------------'
    puts sprintf "%-12s | %7s  | %6s", 'tag', 'unread', 'total'
    @tags.each do |tag, stats|
      unread = stats['unread']
      if unread == 1
        break
      end
      count = stats['count']
      #puts "#{tag}: #{unread}, #{count}"
      puts sprintf "%-12s | %7d  | %6d", tag, unread, count
    end
    puts '================================'
    puts ''
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
  
end