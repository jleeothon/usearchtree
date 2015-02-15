class DepthFirstSearch < SearchAlgorithm

    def insert_node node
        self.list.push(node)
    end

    def remove_node
        self.list.pop
    end

end