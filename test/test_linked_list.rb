# frozen_string_literal: true

require "test_helper"

class TestNode < Minitest::Test
  include LinkedList

  def test_that_it_has_a_version_number
    refute_nil ::LinkedList::VERSION
  end
end
