# Represents to a node in the graph
#
# Author: Johnny Lee Othon
class Node

    attr_accessor :id, :name

    def initialize id, name=nil
        @name = name
        @id = id
        @edges = Hash.new
    end

    # Returns the name of the node or its id as a string.
    def to_s
        @name or "#{@id}"
    end

    # Returns the name of the node or its id as a string.
    def inspect
        self.to_s
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
        @edges.each do |k, v|
            s += " to(#{k})=#{v}"
        end
        return s
    end

    def add_edge node, cost
        @edges[node] = cost
    end

    def cost node
        @edges[node]
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
