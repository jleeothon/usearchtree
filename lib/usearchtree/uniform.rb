class UniformCostSearch < SearchAlgorithm

    def search
        @list = [[0, @start]]
        until @list.empty?
            @history << @list.clone
            cost, parent_node = self.remove_node
            @cache[parent_node.key] = parent_node.key
            @traversal << [cost, parent_node]
            return if parent_node == @goal
            parent_node.edges.each do |edge|
                node = edge.node
                cost = edge.cost
                if not @cache or not @cache.has_key? node.key
                    @cache[node.key] = node
                    unless @tree.has_key? node
                        @tree[node] = parent_node
                    end
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
