class DepthFirstSearch < SearchAlgorithm

    def initialize space, start, goal, caches=true
        super(space, start, goal, caches)
        @list = [@start]
        @traversal = [@start]
    end

    def insert_node node
        @list.push(node)
    end

    def remove_node
        @list.pop
    end

end