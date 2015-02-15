# Consumes a node_labels.txt file
# e.g. http://people.sc.fsu.edu/~jburkardt%20/data/graph_representation/mst_node_labels.txt
def load_label_nodes graph, file
    File.open(file, 'r') do |f|
        f.each.with_index do |line, i|
            line.chomp!
            unless line.empty?
                unless graph.length > i
                    graph.add_node
                end
                graph.label_node(i, line)
            end
        end
    end
    return graph
end

# Loads a distance matrix. Rows correspond to source nodes and columns
# correspond to destination nodes. -1 indicates a non-connection, 0 indicates
# the same node, and positive values indicate an edge.
# 
# 
def load_distance_matrix graph, file
    File.open(file, 'r') do |f|
        f.each.with_index do |line, i|
            costs = line.split
            costs = costs.collect &:to_i
            costs.each.with_index do |cost, j|
                unless graph.length > j
                    graph.add_node
                end
                unless cost.zero? or cost == -1
                    graph.add_edge i, j, cost
                end
            end
        end
    end
    return graph
end
