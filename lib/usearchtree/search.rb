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
            puts "list = #{@list}"
            parent_node = self.remove_node
            @traversal << parent_node
            @cache[parent_node.key] = parent_node
            return if parent_node == @goal
            parent_node.edges.each do |node, cost|
                # puts "parent = #{parent_node}, node = #{node}"
                if not @cache or not @cache.has_key? node.key
                    # puts "putting #{node.key}"
                    @cache[node.key] = node
                    # unless @tree.has_key? node
                        @tree[node] = parent_node
                    # end
                    self.insert_node node
                    # puts "tree = #{@tree}"
                    # puts "traversal = #{@traversal}"
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
            @path.insert(0, node)
            @cost += parent ? parent.cost(node) : 0
            node = parent
        end
        return @path
    end

    def cost
        self.path if @cost.nil?
        return @cost
    end

end