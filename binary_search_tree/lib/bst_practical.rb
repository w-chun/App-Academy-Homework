
def kth_largest(tree_node, k, arr = [])
  return if tree_node.nil?
  kth_largest(tree_node.right, k, arr)
  return arr.last if arr.length == k
  arr.push(tree_node)
  kth_largest(tree_node.left, k, arr)
end
