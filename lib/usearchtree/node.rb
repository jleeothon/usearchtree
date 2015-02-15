# Represents to a node in the graph
#
# Author: Johnny Lee Othon
class Node

    attr_accessor :id, :name

    include Comparable

    def initialize id, name=nil
        @name = name
        @id = id
        @edges = Array.new
    end

    # Returns the name of the node or its id as a string.
    def to_s
        @name or "#{@id}"
    end

    # Returns the name of the node or its id as a string.
    def inspect
        self.to_s
    end

    def <=> other
        return @id <=> other.id
    end

    # Returns the node in the format <tt><id:name></tt>.
    def to_adjacency_list
        s = "#{name}"
        unless @name.nil? or @name.empty?
            s += "(#{@id})"
        end
        unless @edges.empty?
            s += ":"
        end
        @edges.each do |edge|
            s += " to(#{edge.node})=#{edge.cost}"
        end
        return s
    end

    def add_edge node, cost
        @edges << Edge.new(node, cost)
    end

    def cost node
        edge = @edges.find{|e| e.node == node}
        if edge
            edge.cost
        end
    end

    # Gets the name if exists or the id
    def key
        @name or @id
    end

    # Gets an enumerator of the edges
    def edges
        return @edges.each
    end

end
