class Edge

    include Comparable

    # Initializes with the target node and the cost
    def initialize node, cost
        @node = node
        @cost = cost
    end

    attr_reader :node, :cost

    def <=> other
        @node.key <=> other.node.key
    end

    def to_s
        "<#{node.key}, #{cost}>"
    end

    def inspect
        "<#{node.key}, #{cost}>"
    end

end
