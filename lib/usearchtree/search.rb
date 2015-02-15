# Author: Johnny Lee Othon
class SearchAlgorithm

    attr_reader :goal, :space, :start, :traversal, :tree

    # Initializes a search algorithm.
    # Parameters:
    # [space] a graph
    # [start] the id or name of the starting node
    # [goal] the id or name of the goal node
    # [cache] <tt>true</tt> a cache of visited nodes is desired
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
    end

    def search
        until @list.empty?
            parent_node = self.remove_node
            @traversal << parent_node
            @cache[parent_node.key] = parent_node
            if parent_node == @goal
                return
            end
            parent_node.edges.each do |edge|
                node = edge.node
                cost = edge.cost
                if not @cache or not @cache.has_key? node.key
                    @cache[node.key] = node
                    @tree[node] = parent_node
                    self.insert_node node
                end
            end
        end
    end

    # Not implemented
    def insert_node node
    end

    # Not implemented
    def remove_node
    end

    # 
    def path
        return @path if @path.any?
        node = @goal
        @cost = 0
        while node
            parent = @tree[node]
            puts "node is #{node}, parent is #{parent}"
            @path.insert(0, node)
            @cost += parent ? parent.cost(node) : 0
            node = parent
        end
        return @path
    end

    def cost
        self.path if @path.empty?
        return @cost
    end


end