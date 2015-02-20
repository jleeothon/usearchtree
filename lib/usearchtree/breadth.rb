class BreadthFirstSearch < SearchAlgorithm

    def search
        @list = [@start]
        until @list.empty?
            @history << @list.clone
            parent = @list.shift
            @traversal << parent
            @cache[parent.key] = parent
            if parent == @goal
                return
            end
            parent.edges.each do |edge|
                child = edge.node
                if @cache and not @cache.has_key?(child.key)
                    @cache[child.key] = child
                    @tree[child] = parent
                    @list << child
                end
            end
        end
    end
end