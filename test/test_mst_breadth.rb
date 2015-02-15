require 'minitest/autorun'

load 'usearchtree.rb'

class TestMstBreadth < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/mst_node_labels.txt'
    load_distance_matrix @g, 'test/mst_distance_matrix.txt'
    @bfs = BreadthFirstSearch.new @g, "A", "H"
    @bfs.search
  end

  def test_loaders
    puts "\n-----\nAdjacency matrix for mst"
    puts @g.to_adjacency_lists
    puts "-----\n"
    puts "Breadth first search path = #{@bfs.path}"
    puts "Breadth first search tree = #{@bfs.tree}"
    puts "Breadth first search traversal = #{@bfs.traversal}"
  end

  def test_loder_no_unit_cycle
    assert_equal nil, @g.cost(0, 0)
  end

  def test_loder_cost
    assert_equal 11, @g.cost(3, 4)
  end

  def test_loder_no_edge
    assert_equal nil, @g.cost(6, 3)
  end

  def test_search_cost
    assert_equal 8, @bfs.cost
  end

  def test_search_path
    assert_equal "[A, F, E, H]", @bfs.path.to_s
  end

  def test_search_tree
    assert_equal "[]", @bfs.traversal.to_s
  end

  def test_search_traversal
    assert_equal "[]", 
  end

end
