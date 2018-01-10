require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms
#
# def topological_sort(vertices)
#   sorted = []
#   top = []
#   vertices.each do |vertex|
#     if vertex.in_edges.empty?
#       top.push(vertex)
#     end
#   end
#
#   until top.empty?
#     current = top.pop
#     sorted << current
#
#     current.out_edges.each do |edge|
#       to_vertex = edge.to_vertex
#       edge.to_vertex.in_edges.delete(edge)
#       if to_vertex.in_edges.empty?
#         top.push(to_vertex)
#       end
#     end
#     vertices.delete(current)
#   end
#
#   vertices.empty? ? sorted : []
# end

#--------------Tarjan's Algorithm----------
def topological_sort(vertices)
  ordering = []
  explored = Set.new

  vertices.each do |vertex| # O(|v|)
    dfs!(vertex, explored, ordering) unless explored.include?(vertex)
  end

  ordering
end

def dfs!(vertex, explored, ordering)
  explored.add(vertex)

  vertex.out_edges.each do |edge| # O(|e|)
    new_vertex = edge.to_vertex
    dfs!(new_vertex, explored, ordering) unless explored.include?(new_vertex)
  end

  ordering.unshift(vertex)
end
