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
    p leaf_to_add_to
  end

  # Use node that is returned as argument in other methods
  def traverse_to_leaf(node, score)
    if node.is_leaf?
      # This is the node reference that will be used for other methods
      return node
    elsif node.score < score
      traverse_to_leaf(node.left, score)
    elsif node.score > score
      traverse_to_leaf(node.right, score)
    end
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

b = BinarySearchTree.new(58, "Indiana Jones")
b.insert(99, "Star Trek")
# p b.traverse_to_leaf(b.root_node, 75)