def in_order_traversal(root)
  return unless root
  in_order_traversal(root.left)
  puts root.data
  in_order_traversal(root.right)
end

def pre_order_traversal(root)
  return unless root
  puts root.data
  pre_order_traversal(root.left)
  pre_order_traversal(root.right)
end

def post_order_tranversal(root)
  return unless root
  post_order_traversal(root.left)
  post_order_traversal(root.right)
  puts root.data
end

# time complexity is O(n) where n is the number of nodes in the tree
# space complexity is O(h) where h is the height of the tree, since the
# max depth of the call stack will be a function of h. the min value of h
# is log(n) for a complete tree, and the max is n, for a skewed tree (linked list)
