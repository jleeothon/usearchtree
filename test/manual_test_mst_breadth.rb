require 'usearchtree'

g = Graph.new
load_label_nodes g, '.\test\mst_node_labels.txt'
load_distance_matrix g, '.\test\mst_distance_matrix.txt'

puts g.to_adjacency_lists
puts

algorithm = BreadthFirstSearch.new g, "A", "H"
algorithm.search

puts "The connections in the resulting tree"
puts algorithm.tree
puts

puts "The tree traversal"
p algorithm.traversal
puts

puts "The resulting path"
puts algorithm.path
puts

puts "The cost of this path"
puts algorithm.cost
puts

puts "The whole queue history"
algorithm.history.each do |h|
    p h
end
puts

