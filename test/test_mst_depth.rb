require 'minitest/autorun'

load 'usearchtree.rb'

class TestMstDepth < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/mst_node_labels.txt'
    load_distance_matrix @g, 'test/mst_distance_matrix.txt'
    @dfs = DepthFirstSearch.new @g, "A", "H"
    @dfs.search
  end

  def test_loaders
    puts "\n-----\nAdjacency matrix for mst"
    puts @g.to_adjacency_lists
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

  def test_search_cost
    puts "Depth first search cost = #{@dfs.cost}"
    assert_equal 50, @dfs.cost
  end

  def test_search_path
    puts "Depth first search path = #{@dfs.path}"
    assert_equal "[A, B, C, I, H]", @dfs.path.to_s
  end

  def test_search_tree
    puts "Depth first search tree = #{@dfs.tree}"
  end

  def test_search_traversal
    puts "Depth first search traversal = #{@dfs.traversal}"
  end

end
