require 'minitest/autorun'

load 'usearchtree.rb'

class TestUsaUniformCost < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/usa_labels.txt'
    load_distance_matrix @g, 'test/usa_adj_matrix.txt'
    @bfs = UniformCostSearch.new @g, "MA", "WA"
    @bfs.search
  end

  def test_no_unit_cycle
    assert_equal nil, @g.cost(0, 0)
  end

  def test_cost
    assert_equal 1, @g.cost(3, 4)
  end

  def test_no_edge
    assert_equal nil, @g.cost(6, 3)
  end

  def test_search_cost
    assert_equal 13, @bfs.cost
  end

  def test_search_path
    assert_equal "[MA, NY, PA, OH, IN, IL, MO, KS, CO, NM, AR, NV, ID, WA]", @bfs.path.to_s
  end

end
