require 'minitest/autorun'

load 'usearchtree.rb'

class TestLoaderMst < MiniTest::Test

  def setup
    @g = Graph.new
    load_label_nodes @g, 'test/mst_node_labels.txt'
    load_distance_matrix @g, 'test/mst_distance_matrix.txt'
  end

  def test_node_identity_A
    assert_equal @g.node(0), @g.node("A")
  end

  def test_node_identity_E
    assert_equal @g.node(4), @g.node("E")
  end

  def test_connection_A_B
    assert_equal 3, @g.cost("A", "B")
  end

  def test_connection_B_A
    assert_equal 3, @g.cost("B", "A")
  end

  def test_connection_I_H
    assert_equal 12, @g.cost("I", "H")
  end

  def test_no_connection_B_F
    assert_equal nil, @g.cost("B", "F")
  end

end

