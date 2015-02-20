require 'minitest/autorun'

load 'usearchtree.rb'

class TestMstUniform < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/mst_node_labels.txt'
    load_distance_matrix @g, 'test/mst_distance_matrix.txt'
    @ucs = UniformCostSearch.new @g, "A", "H"
    @ucs.search
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

  def test_search_cost
    assert_equal 8, @ucs.cost
  end

  def test_search_path
    assert_equal "[A, F, E, H]", @ucs.path.to_s
  end

end
