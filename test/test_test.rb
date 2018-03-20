require 'minitest/autorun'
require 'minitest/pride'
require './lib/test'

class TestingTest < MiniTest::Test
  def test_that_test_exists
    a_test = Testing.new
    assert_instance_of Testing, a_test
  end

  def test_hash_results
    a_test = Testing.new
    assert_equal ({"b"=>"test"}), a_test.hash_stuff
  end
end