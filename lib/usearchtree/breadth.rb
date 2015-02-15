class BreadthFirstSearch < SearchAlgorithm

    def initialize space, start, goal, caches=true
        super(space, start, goal, caches)
        @traversal = [@start]
        @list = [@start]
    end

    def insert_node node
        @list << node
    end

    def remove_node
        @list.shift
    end

end