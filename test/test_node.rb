# frozen_string_literal: true

require_relative "test_helper"

class TestNode < Minitest::Test
  include LinkedList

  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_new_node_has_no_successor
    assert_nil Node.new.next
  end

  def test_new_default_node_has_node_value
    assert_nil Node.new.value
  end

  def test_init_new_node_with_value
    assert_equal :foo, Node.new(:foo).value
  end
end
