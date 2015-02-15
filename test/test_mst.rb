require 'minitest/autorun'

load 'usearchtree.rb'

class TestMst < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/mst_node_labels.txt'
    load_distance_matrix @g, 'test/mst_distance_matrix.txt'
    @bfs = BreadthFirstSearch.new @g, "A", "H"
    @bfs.search
  end

  def test_loaders
    puts "\n-----\nAdjacency matrix for mst"
    p @g.to_adjacency_lists
    puts "-----\n"
  end

  def test_no_unit_cycle
    assert_equal nil, @g.cost(0, 0)
  end

  def test_cost
    assert_equal 11, @g.cost(3, 4)
  end

  def test_no_edge
    assert_equal nil, @g.cost(6, 3)
  end

  def test_breadth_first_cost
    assert_equal 9, @bfs.cost
  end

end
