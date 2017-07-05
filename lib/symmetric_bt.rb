# write a function to determine if a binary tree is symmetric

# naive solution: if the in-order traversal is palindromic then
# the tree overall is palindromic. 
def symmetric?(node)
  array = in_order_traversal(node)
  p array
  array == array.reverse
end

def in_order_traversal(node)
  results = []
  return results unless node
  results += in_order_traversal(node.left)
  results << node.data
  results += in_order_traversal(node.right)
  results
end

def iot(node)
  return unless node
  iot(node.left)
  p node.data
  iot(node.right)
end

class Node
  attr_accessor :data, :left, :right

  def initialize(data: nil, left: nil, right: nil)
    @data = data
    @left = left
    @right = right
  end

  def inspect
    "Node(data: #{@data}, left:#{@left}, right:#{@right})"
  end

end

a = Node.new(data: 3)
b = Node.new(data: 3)
c = Node.new(data: 6, right: b)
d = Node.new(data: 6, left: a)
e = Node.new(data: 2, right: c)
f = Node.new(data: 2, left: d)
g = Node.new(data: 0, left: e, right: f)

def is_symmetric?(tree)

  def check_symmetric(subtree_0, subtree_1)
    return true unless subtree_0 || subtree_1
    if subtree_0 && subtree_1
      return (subtree_0.data == subtree_1.data &&
        check_symmetric(subtree_0.left, subtree_1.right) &&
        check_symmetric(subtree_0.right, subtree_1.left))
    end
    false
  end

  !tree || check_symmetric(tree.left, tree.right)
end

p is_symmetric?(g)
