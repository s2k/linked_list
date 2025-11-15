# frozen_string_literal: true

require_relative "linked_list/version"

module LinkedList
  class Error < StandardError; end

  # A Node represents an element of the linked list
  # A node has a _value_, available via @value and a
  # next element, available via @next (or @succ).
  #
  class Node

    attr_accessor :value, :next

    def initialize(value = nil)
      @value = value
    end

    def append(node)
      self.next = node
      node
    end
    alias :<< :append
  end
end
