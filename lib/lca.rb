# write a function that finds the least common ancestor, one with and
# one without the nodes having knowledge of their ancestors.

# the root is the least common ancestor when the nodes are in different subtrees
# of the root. ie if one is in the left and the other is in the right.

def lca(tree, node_0, node_1)
  Struct.new("Status", :num_nodes, :ancestor)

  def lca_helper(tree, node_0, node_1)
    return Status(0, nil) unless tree

    left_result = lca_helper(tree.left, node0, node1)
    return left_result if left_result.num_nodes == 2

    right_result = lca_helper(tree.right, node_0, node_1)
    return right_result if right_result.num_nodes == 2

    delta = tree == node_0 || tree == node_1 ? 1 : 0
    num_nodes = left_result.num_nodes + right_result.num_nodes + delta 

    Status(num_nodes, num_nodes == 2 ? tree : nil)
  end

  lca_helper(tree, node0, node1).ancestor
end
