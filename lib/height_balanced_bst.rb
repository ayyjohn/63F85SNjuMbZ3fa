# write a function that takes the root node of a binary tree and returns whether
# the tree is height balanced, ie if there are no places where the depth of
# a right subtree is more than +/- 1 of the left.

# compute the height for every node, then check left and right subtrees
# and ensure the difference is less than two.

def is_balanced(root)
  Struct.new("BalancedStatus", :balanced, :height)
  check_balanced(root).balanced
end

def check_balanced(root)
  return BalancedStatus.new(true, -1) unless root

  left_result = check_balanced(root.left)
  return BalancedStatus.new(false, 0) unless left_result.balanced

  right_result = check_balanced(root.right)
  return BalancedStatus.new(false, 0) unless right_result.balanced

  is_balanced = abs(left_result.height - right_result.height) <= 1
  height = max(left_result.height, right_result.height) + 1
  BalancedStatus.new(is_balanced, height).balanced
end
