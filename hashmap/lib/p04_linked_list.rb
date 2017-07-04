class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    current = @head
    until current == @tail
      return current.val if current.key == key
      current = current.next
    end
    nil
  end

  def include?(key)
    current = @head
    until current == @tail
      current = current.next
      return true if current.key == key
    end
    false
  end

  def append(key, val)
    new = Node.new(key, val)
    @tail.prev.next = new
    new.prev = @tail.prev
    @tail.prev = new
    new.next = @tail
  end

  def update(key, val)
    current = @head
    until current.key == key || current == @tail
      current = current.next
    end
    current.val = val
  end

  def remove(key)
    current = @head
    until current.key == key
      current = current.next
    end
    current.prev.next = current.next
    current.next.prev = current.prev
  end

  def inspect
    current = @head
    until current == @tail
      p [current.key, current.val]
      current = current.next
    end
    puts ""
  end

  def each
    current = @head
    until current.next == @tail
      current = current.next
      yield current
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
