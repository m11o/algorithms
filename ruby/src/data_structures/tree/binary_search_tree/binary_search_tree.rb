require_relative 'binary_search_tree_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = BinarySearchTreeNode.new
  end

  def insert(value)
    root.insert value
  end

  def to_s
    root.to_s
  end

  def include?(value)
    @root.include? value
  end

  def remove(value)
    @root.remove value
  end
end
