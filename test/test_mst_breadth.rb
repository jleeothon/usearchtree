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
    puts "Breadth first search cost = #{@bfs.cost}"
    assert_equal 50, @bfs.cost
  end

  def test_search_path
    puts "Breadth first search path = #{@bfs.path}"
    assert_equal "[A, B, C, I, H]", @bfs.path.to_s
  end

  def test_search_tree
    puts "Breadth first search tree = #{@bfs.tree}"
  end

  def test_search_traversal
    puts "Breadth first search traversal = #{@bfs.traversal}"
  end

end
