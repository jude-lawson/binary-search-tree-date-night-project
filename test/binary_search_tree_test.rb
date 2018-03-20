require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < MiniTest::Test

  def setup
    @tree = BinarySearchTree.new(58, "Armageddon")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(85, "Star Trek")
  end

  def test_binary_search_tree_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_tree_has_root_node_reference
    assert_equal {"score" => 58, "title" => "Armageddon"}, @tree.root_node
  end

  def test_inserting_new_nodes_into_tree
    assert_equal 1, @tree.insert(80, "Star Wars: The Force Awakens")
  end

  def test_finding_included_nodes_by_score_value
    assert @tree.include?(92)
  end

  def test_finding_depth_of_given_score
    assert_equal 1, tree.depth_of(92)
  end

  def test_finding_movie_with_highest_score
  end

  def test_finding_movie_with_lowest_score
  end

  # Lowest score to highest score
  def test_sorting_nodes_into__array_by_ascending_score_value
  end

  def test_loading_csv_file_into_tree
  end

  def test_retrieving_node_health_data
  end

  def test_counting_tree_leaves
  end

  def test_getting_maximum_height_of_tree
  end

  def test_deleting_nodes_from_tree
  end


end
