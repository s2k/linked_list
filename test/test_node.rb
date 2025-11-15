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

  def test_can_change_node_value
    node = Node.new(:foo)

    node.value = :other

    assert_equal :other, node.value
  end

  def test_can_set_successor
    root = Node.new(:foo)
    new_node = Node.new(:other)

    root.next = new_node

    assert_equal :other, root.next.value
  end

  def test_succ_also_returns_following_element
    root = Node.new(:root)
    root << Node.new << Node.new(:foo)

    assert_equal :foo, root.succ.next.value
  end

  def test_append_also_set_next_element
    root = Node.new(:foo)
    new_node = Node.new(:other)
    root.append new_node

    assert_equal :other, root.next.value
  end

  def test_lessless_also_appends_node
    root = Node.new(:foo)
    new_node = Node.new(:other)
    root << new_node << Node.new(:wahoodie)

    assert_equal :other, root.next.value
    assert_equal :wahoodie, root.next.next.value
  end

  def test_can_chain_append_calls
    root = Node.new(:foo)
    new_node = Node.new(:other)
    root.append(new_node).append(Node.new(42))

    assert_equal :other, root.next.value
    assert_equal 42, root.next.next.value
  end

  def test_insert_after_in_the_middle
    root = Node.new(:root)
    initial_second = Node.new(:second)
    root << initial_second
    root.insert_after Node.new(:new_element)

    assert_equal :root, root.value
    assert_equal :new_element, root.next.value
    assert_equal :second, root.next.next.value
  end

  def test_insert_after_at_the_end
    root = Node.new(:root)
    root << Node.new(:second)
    root.next.insert_after Node.new(:new_element)

    assert_equal :root, root.value
    assert_equal :second, root.next.value
    assert_equal :new_element, root.next.next.value
  end

  def test_can_count_follower_nodes
    root = Node.new(:root)
    current = root
    follower_count = rand(3..11_000)
    follower_count.times do |i|
      current << Node.new(i)
      current = current.next
    end

    assert_equal follower_count + 1, root.size
  end

  def test_empty_list_converts_to_empty_array
    root = Node.new

    assert_empty root.to_a
  end

  def test_can_convert_non_empty_list_to_array
    root = Node.new(0)
    root << Node.new(1) << Node.new(2) << Node.new(3)

    assert_equal [0, 1, 2, 3], root.to_a
  end
end
