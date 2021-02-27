class LinkedListNode
  attr_accessor :value, :next

  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end

  def to_s
    return yield value if block_given?

    value.to_s
  end

  def deep_dup
    Marshal.load Marshal.dump(self)
  end
  alias deep_clone deep_dup
end
