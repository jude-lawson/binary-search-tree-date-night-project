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
    # binding.pry
    if new_node.score == current_node.score
      return
    elsif new_node.score > current_node.score
      # if current_node.right_child || current_node.left_child
      if current_node.right_child
        traverse_to_add(current_node.right_child, new_node)
      else
        new_node.depth = current_node.depth + 1
        current_node.right_child = new_node
      end
    elsif new_node.score < current_node.score
      # if current_node.left_child || current_node.right_child
      if current_node.left_child
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

  def traverse_to_value(current_node, score)
    if score == current_node.score
      current_node.score
    elsif score > current_node.score && current_node.right_child
      traverse_to_value(current_node.right_child, score)
    elsif score < current_node.score && current_node.left_child
      traverse_to_value(current_node.left_child, score)
    else
      false
    end
  end

  def include?(score)
    if traverse_to_value(@root_node, score) == score
      true
    else
      false
    end
  end

  def depth_of(score)
    traverse_for_depth(@root_node, score).depth
  end

  def max
    nodes = sort(@root_node)
    nodes[-1]
  end

  def min
    nodes = sort(@root_node)
    nodes[0]
  end

  def get_sorted_nodes(current_node)
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
    data = File.read("./data/movies.txt")
    items = data.split("\n")
    entries = items.map do |item|
      item.split(",")
    end
    entries.each do |entry|
      self.insert(entry[0].to_i, entry[1])
    end
    entries.length
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