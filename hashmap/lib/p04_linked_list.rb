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
    @next.prev = @prev
    @prev.next = @next
    self
  end
end

class LinkedList

  include Enumerable

  attr_accessor :head, :tail
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
    each do |node|
      current = node
      return current.val if current.key == key
    end
    nil
  end

  def include?(key)
    each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.prev = @tail.prev
    @tail.prev = new_node
    new_node.next = @tail
    new_node
  end

  def update(key, val)
    current = @head
    each do |node|
      current = node
      break if current.key == key
    end
    current.val = val unless current == @head
  end

  def remove(key)
    current = @head
    each do |node|
      current = node
      break if current.key == key
    end
    current.remove
    current
  end

  def pop
    last.remove
  end

  def shift
    first.remove
  end

  def unshift(key, val)
    new_node = Node.new(key, val)
    first.prev = new_node
    new_node.next = first
    @head.next = new_node
    new_node.prev = @head
    new_node
  end

  def inspect
    each do |node|
      p [node.key, node.val]
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

  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
