require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top.push(vertex)
    end
  end

  until top.empty?
    current = top.pop
    sorted << current

    current.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      edge.to_vertex.in_edges.delete(edge)
      if to_vertex.in_edges.empty?
        top.push(to_vertex)
      end
    end
    vertices.delete(current)
  end

  vertices.empty? ? sorted : []
end
