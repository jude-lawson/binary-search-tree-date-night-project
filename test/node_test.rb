require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < MiniTest::Test

  def setup
    @node = Node.new(58, "Armageddon")
  end

  def test_node_exists
    assert_instance_of Node, @node
  end

end