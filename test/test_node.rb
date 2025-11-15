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
end
