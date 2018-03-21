class Node

  attr_reader :reference,
              :score

  attr_accessor :left_child,
                :right_child

  def initialize(score, title)
    @reference = {title=>score}
    @score = score
    @title = title
    @left_child = nil
    @right_child = nil
    @parent_relationship = {}
  end

  def is_leaf?
    if @left_child || @right_child
      false
    else
      true
    end
  end

end