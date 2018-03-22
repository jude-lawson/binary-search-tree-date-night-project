require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require './lib/node'
require 'pry'

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
    # binding.pry
    assert_equal ({"Armageddon"=>58}), @tree.root_node.reference
    assert_instance_of Node, @tree.root_node
  end

  def test_inserting_new_nodes_into_tree
    #Double-check expected values
    assert_equal 3, @tree.insert(80, "Star Wars: The Force Awakens")
    # assert_equal 2, @tree.insert(93, "Star Trek: Into Darkness")
    # ^ This assert throws a really weird error unless new_node.depth in insert
    # method is commented out.
  end

  def test_sorting_the_tree
    @tree.insert(80, "Star Wars: The Force Awakens")
    assert_equal ([{"Armageddon"=>58},{"Star Wars: The Force Awakens"=>80},{"Star Trek"=>85},{"Sharknado 3"=>92}]), @tree.sort(@tree.root_node)
  end

  def test_finding_included_nodes_by_score_value
    skip
    assert @tree.include?(92)
  end

  def test_finding_depth_of_given_score
    skip
    assert_equal 1, @tree.depth_of(92)
  end

  def test_root_depth
    assert_equal 0, @tree.depth_of(58)
  end

  # most return values that return title return a hash like this {"Sharknado 3"=>92}

  def test_finding_movie_with_highest_score
    skip
    assert_equal ({"Sharknado 3" => 92}), @tree.max
  end

  def test_finding_movie_with_lowest_score
    skip
    assert_equal ({"Armageddon" => 58}), @tree.min
  end

  # Lowest score to highest score
  def test_sorting_nodes_into__array_by_ascending_score_value
    skip
    assert_equal [({"Armageddon" => 58}),({"Star Trek" => 85}),({"Sharknado 3" => 92})], @tree.sort
  end

  def test_loading_csv_file_into_tree
    skip
    tree = BinarySearchTree.new(99, "Lord Of The Rings: The Fellowship Of The Ring")
    assert_equal 5, tree.load("./data/movies.txt")
  end

  def test_score_is_ignored_when_already_present_in_tree
    skip
    tree = BinarySearchTree.new(92, "Star Wars: Return Of The Jedi")
    assert_equal 4, tree.load("./data/movies.txt")
  end

  def test_retrieving_node_health_data
    skip
    @tree.insert(95, "Star Trek")
    assert_equal [[85, 1, 25], [95, 1, 25]],@tree.health(2)
  end

  def test_counting_tree_leaves
    skip
    @tree.insert(95, "Star Trek")
    assert_equal 2, @tree.leaves
  end

  def test_getting_maximum_height_of_tree
    skip
    assert_equal 2, @tree.height
  end

  def test_deleting_nodes_from_tree
    skip
    @tree.insert(95, "Star Trek")
    @tree.delete(92)
    # Test with array in left to right order , (we could also then get all tree children by then adding top to bottom order)
    assert_equal 58, @tree.root_node
    assert_equal [95], @tree.root_node.children
  end

  def test_deleting_root_node_from_tree
    skip
    @tree.insert(95, "Star Trek")
    @tree.delete(58)
    assert_equal 92, @tree.root_node
    assert_equal [85, 95], @tree.root_node.children
  end


end
