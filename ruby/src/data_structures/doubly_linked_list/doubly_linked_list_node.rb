require_relative '../linked_list/linked_list_node'

class DoublyLinkedListNode < LinkedListNode
  attr_accessor :previous

  def initialize(value, next_node = nil, previous_node = nil)
    super(value, next_node)
    @previous = previous_node
  end
end
