# Author: Johnny Lee Othon
class SearchAlgorithm

    attr_reader :goal, :history, :space, :start, :traversal, :tree

    # Initializes a search algorithm.
    # Parameters:
    # [space] a graph
    # [start] the id or name of the starting node
    # [goal] the id or name of the goal node
    # [cache] <code>true</code> a cache of visited nodes is desired
    def initialize space, start, goal, caches=true
        @space = space
        @start = space.node(start)
        @goal = space.node(goal)
        # node.key => node
        @cache = (Hash.new if caches)
        # order in which the graph nodes were traversed
        @traversal = Array.new
        # parent => parent_node
        @tree = {@start => nil}
        # lazy list of nodes from start to goal
        @path = Array.new
        # lazy total of cost from start to goal
        @cost = nil
        # history to see the history of the stack
        @history = Array.new
    end

    # Performs the search and populates <code>traversal</code> and
    # <code>tree</code>
    def search
        throw "Unimplemented"
    end

    # Returns a list of all nodes in order from start to goal.
    def path
        return @path if @path.any?
        node = @goal
        @cost = 0
        while node
            parent = @tree[node]
            @path.insert(0, node)
            @cost += parent ? parent.cost(node) : 0
            node = parent
        end
        return @path
    end

    # Retruns the total cost from start to goal following the path specifed in
    # <code>SearchAlgorithm#Path</code>.
    def cost
        self.path if @path.empty?
        return @cost
    end


end