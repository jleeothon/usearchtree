class UniformCostSearch < SearchAlgorithm
    def search
        @list = [[0, @start]]
        until @list.empty?
            @history << @list.clone
            cost, parent_node = @list.shift
            @cache[parent_node.key] = parent_node.key
            @traversal << [cost, parent_node]
            return if parent_node == @goal
            pcost = cost
            parent_node.edges.each do |edge|
                node = edge.node
                cost = edge.cost + pcost
                if not @cache or not @cache.has_key? node.key
                    @cache[node.key] = node
                    unless @tree.has_key? node
                        @tree[node] = parent_node
                    end
                    @list << [cost, node]
                end
            end
        end
    end
end
