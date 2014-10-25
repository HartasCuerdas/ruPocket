class TagStats

  def initialize(tags)
    @tags = tags.getTags
  end

  def print
    printMostUsed
    puts ''
    printMostUnread
  end

  def printMostUsed
    @tags = @tags.sort_by{|_key, stats| stats['count']}.reverse!
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
      puts sprintf "%-12s | %7d  | %6d", tag, unread, count
    end
    puts '================================'
  end

end