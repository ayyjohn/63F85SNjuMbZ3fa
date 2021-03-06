require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_node!(@map[key])
    else
      calc!(key)
      eject! if count > @max
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @map[key] = @store.append(key, @prc.call(key))
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    key, val = node.key, node.val
    node.remove
    @store.append(key, val)
  end

  def eject!
    @map.delete(@store.shift.key)
  end
end
