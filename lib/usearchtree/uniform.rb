class UniformCostSearch < SearchAlgorithm

    def insert_node node
        self.list << node
        self.list.sort!
    end

    def remove_node
        self.list.shift
    end

end