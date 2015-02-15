class UniformCostSearch < SearchAlgorithm

    def initialize space, start, goal, caches=true
        super(space, start, goal, caches)
        @list = [[0, @start]]
        @traversal = [[0, @start]]
    end

    def search
        until @list.empty?
            cost, parent_node = self.remove_node
            return if parent_node == @goal
            parent_node.edges.each do |node, cost|
                if not @cache or not @cache.has_key? node.key
                    @cache[node.key] = node
                    unless @tree.has_key? node
                        @tree[node] = parent_node
                    end
                    @traversal << [cost, node]
                    self.insert_node node, cost
                end
            end
        end
    end

    def insert_node node, cost
        @list << [cost, node]
        @list.sort!
    end

    def remove_node
        @list.shift
    end

end