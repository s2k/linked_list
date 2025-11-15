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

    alias succ next
    def initialize(value = nil)
      @value = value
    end

    def append(node)
      self.next = node
      node
    end

    alias << append

    def insert_after(other)
      other.next = self.next
      self.next = other
    end

    def size
      count = 1
      curr = self
      count += 1 while (curr = curr.next)
      count
    end

    def to_a
      return [] if value.nil?

      res = []
      current = self
      loop do
        res << current.value
        current = current.next
        break if current.nil?
      end
      res
    end
  end
end
