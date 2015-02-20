class DepthFirstSearch < SearchAlgorithm

    def search
        @list = [@start]
        @traversal = [@start]
        until @list.empty?
            @history << @list.clone
            parent_node = @list.pop
            @traversal << parent_node
            @cache[parent_node.key] = parent_node
            if parent_node == @goal
                return
            end
            parent_node.edges.reverse_each do |edge|
                node = edge.node
                cost = edge.cost
                if not @cache or not @cache.has_key? node.key
                    @cache[node.key] = node
                    @tree[node] = parent_node
                    @list.push node
                end
            end
        end
    end
end