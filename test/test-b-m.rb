require 'usearchtree'

start = Time.now

(0...10000).each do
    g = Graph.new
    load_label_nodes g, '.\test\usalabels.txt'
    load_distance_matrix g, '.\test\usadist.txt'
    algorithm = DepthFirstSearch.new g, "WA", "MA"
    algorithm.search
end


stop = Time.now
puts (stop - start)