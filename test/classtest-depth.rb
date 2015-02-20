require 'usearchtree'

g = Graph.new
load_label_nodes g, '.\test\classtest-labels.txt'
load_distance_matrix g, '.\test\classtest-distance.txt'

puts g.to_adjacency_lists
puts

algorithm = DepthFirstSearch.new g, "A", "F"
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

