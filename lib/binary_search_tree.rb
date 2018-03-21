require 'pry'
require './lib/node'

class BinarySearchTree

  attr_reader :root_node

  def initialize(root_node_score, root_node_title)
    @root_node = Node.new(root_node_score, root_node_title)
  end

  def insert(score, title)
    new_node = Node.new(score, title)
    leaf_to_add_to = self.traverse_to_leaf(@root_node, score)
    if leaf_to_add_to.score > new_node.score
      leaf_to_add_to.left_child = new_node
    else
      leaf_to_add_to.right_child = new_node
    end
    leaf_to_add_to
  end

  # Use node that is returned as argument in other methods
  def traverse_to_leaf(current_node, score)
    if current_node.is_leaf?
      # This is the current_node reference that will be used for other methods
      current_node
    elsif current_node.score < score && current_node.left_child != nil
      traverse_to_leaf(current_node.left_child, score)
    elsif current_node.score > score && current_node.right_child != nil
      traverse_to_leaf(current_node.right_child, score)
    end
    current_node
  end

  def traverse_to_value
  end


  end

  def include?(score)
  end

  def search(node)

  def depth_of(score)
  end

  def max
  end

  def min
  end

  def sort
  end

  def load(movies)
  end

  def health(depth)
  end

  # def is_leaf?(node)
  #   if node.left_child || node.right_child
  #     false
  #   else
  #     true
  #   end
  # end

  def leaves

  end

  def height
  end

  def delete(score)
  end

end