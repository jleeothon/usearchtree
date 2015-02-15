require 'minitest/autorun'

load 'usearchtree.rb'

class TestMst < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/mst_node_labels.txt'
    load_distance_matrix @g, 'test/mst_distance_matrix.txt'
    @ucs = UniformCostSearch.new @g, "A", "H"
    @ucs.search
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
    puts "Uniform cost search cost = #{@ucs.cost}"
    assert_equal 50, @ucs.cost
  end

  def test_search_path
    puts "Uniform cost search path = #{@ucs.path}"
    assert_equal "[A, B, C, I, H]", @ucs.path.to_s
  end

  def test_search_tree
    puts "Uniform cost search tree = #{@ucs.tree}"
  end

  def test_search_traversal
    puts "Uniform cost search traversal = #{@ucs.traversal}"
  end

end
