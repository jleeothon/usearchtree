# Represents any weighted, directed graph.
#
# Author: Johnny Lee Othon
class Graph

    def initialize
        @nodes = Array.new
        @next_id = 0
    end

    # Returns the list of nodes
    def to_s
        @nodes.to_s
    end

    # Returns the graph as a list of adjacencies
    def to_adjacency_lists
        if @nodes.empty?
            "Empty graph"
        else
            @nodes.collect{|node| node.inspect}.join("\n")
        end
    end

    def node key
        if key.kind_of? Integer
            @nodes[key]
        else
            @nodes.find{|n| n.name == key}
        end
    end

    # Adds a node to the graph and optionally sets a name.
    def add_node name=nil
        @nodes << Node.new(self.next_id, name)
    end

    # Adds an edge from node i to node j. Where i and j can be an index or a
    # name.
    def add_edge i, j, cost
        self.node(i).add_edge self.node(j), cost
    end

    # Labels a single node with index i. Fails if the node does not exist.
    def label_node i, name
        @nodes[i].name = name
    end

    # Gets the number of nodes in the graph
    def length
        @nodes.length
    end

    # Gets the cost from node at i to node at j.
    def cost i, j
        nodeI = (i.kind_of? Node) ? i : self.node(i)
        nodeJ = (j.kind_of? Node) ? j : self.node(j)
        nodeI.cost(nodeJ)
    end

    # Gets and increases the next id.
    def next_id
        id = @next_id
        @next_id += 1
        id
    end

end
