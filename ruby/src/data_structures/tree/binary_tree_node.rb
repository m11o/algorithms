require_relative '../hash_table/hash_table'

class BinaryTreeNode
  attr_reader :left, :right, :meta
  attr_accessor :parent, :value

  def self.copy_node(source_node, target_node)
    target_node.value = source_node.value
    target_node.left = source_node.left
    target_node.right = source_node.right
  end

  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = nil

    @meta = HashTable.new
  end

  def left=(node)
    @left.parent = nil unless @left.nil?
    @left = node
    @left.parent = self unless @left.nil?
  end

  def right=(node)
    @right.parent = nil unless @right.nil?
    @right = node
    @right.parent = self unless @right.nil?
  end

  def remove_child(node)
    if !@left.nil? && @left == node
      @left = nil
      return true
    end

    if !@right.nil? && @right == node
      @right = nil
      return true
    end

    false
  end

  def replace_child(old_node, new_node)
    return false if old_node.nil? || new_node.nil?

    if !@left.nil? && @left == old_node
      @left = new_node
      return true
    end

    if !@right.nil? && @right == old_node
      @right = new_node
      return true
    end

    false
  end

  def traverse_in_order
    traverse = []

    traverse.concat @left.traverse_in_order unless @left.nil?
    traverse << @value
    traverse.concat @right.traverse_in_order unless @right.nil?
    traverse
  end

  def to_s(&block)
    block = block || ->(value) { value }
    traverse_in_order.map(&block).join(',')
  end

  def height
    [left_height, right_height].max
  end

  def left_height
    return 0 if left.nil?

    left.height + 1
  end

  def right_height
    return 0 if right.nil?

    right.height + 1
  end

  def balance_factor
    left_height - right_height
  end

  def uncle
    return nil if parent.nil?
    return nil if parent.parent.nil?
    return nil if parent.parent.left.nil? || parent.parent.right.nil?
    return parent.parent.right if parent == parent.parent.left

    parent.parent.left
  end
end
