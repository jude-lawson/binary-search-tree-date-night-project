require 'pry'
require './lib/node'

class BinarySearchTree

  attr_reader :root_node

  def initialize(root_node_score, root_node_title)
    @root_node = Node.new(root_node_score, root_node_title)
  end

  def insert(score, title)
    new_node = Node.new(score, title)
    traverse_to_add(@root_node, new_node)
    new_node.depth
  end

  def traverse_to_add(current_node, new_node)
    if new_node.score == current_node.score
      return
    elsif new_node.score > current_node.score
      if current_node.right_child || current_node.left_child
        traverse_to_add(current_node.right_child, new_node)
      else
        new_node.depth = current_node.depth + 1
        current_node.right_child = new_node
      end
    elsif new_node.score < current_node.score
      if current_node.left_child || current_node.right_child
        traverse_to_add(current_node.left_child, new_node)
      else
        new_node.depth = current_node.depth + 1
        current_node.left_child = new_node
      end
    end
  end

  def traverse_for_depth(current_node, score)
    if score == current_node.score
      current_node
    elsif score > current_node.score
      traverse_for_depth(current_node.right_child, score)
    elsif score < current_node.score
      traverse_for_depth(current_node.left_child, score)
    end
  end

  def include?(score)
  end

  def depth_of(score)
    traverse_for_depth(@root_node, score).depth
  end

  def max
  end

  def min
  end

  def get_sorted_nodes(current_node)
    # if current_node == nil
    #   []
    # else
    #   [sort(current_node.left_child)] + [current_node] + [sort(current_node.right_child)]
    # end

    if current_node == nil
      []
    else
      [get_sorted_nodes(current_node.left_child)] + [current_node] + [get_sorted_nodes(current_node.right_child)]
    end
  
  end

  def sort(current_node)
    flattened_array = get_sorted_nodes(current_node).flatten
    items = flattened_array.map do |item|
      item.reference
    end
  end

  def load(movies)
  end

  def health(depth)
  end

  def leaves

  end

  def height
  end

  def delete(score)
  end

end