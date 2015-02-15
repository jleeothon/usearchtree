class BreadthFirstSearch < SearchAlgorithm

    def insert_node node
        self.list << node
    end

    def remove_node
        self.list.shift
    end

end