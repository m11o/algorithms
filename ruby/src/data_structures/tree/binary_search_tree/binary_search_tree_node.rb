require_relative '../binary_tree_node'

class BinarySearchTreeNode < BinaryTreeNode
  def initialize(value = nil)
    super value
  end

  def insert(value)
    @value = value and return self if @value.nil?
    return self if @value == value

    if @value < value
      return @right.insert value unless @right.nil?

      new_node = self.class.new value
      self.right = new_node
      new_node
    else
      return @left.insert value unless @left.nil?

      new_node = self.class.new value
      self.left = new_node
      new_node
    end
  end

  def include?(value)
    return true if @value == value

    if !@left.nil? && value < @value
      return @left.include? value
    elsif !@right.nil? && value > @value
      return @right.include? value
    end

    false
  end

  def find_min
    return self if @left.nil?

    @left.find_min
  end

  def find(value)
    return self if @value == value

    if !@left.nil? && value < @value
      @left.find value
    elsif !@right.nil? && value > @value
      @right.find value
    end
  end

  def remove(value)
    node = find value
    raise if node.nil?

    parent = node.parent

    if node.left.nil? && node.right.nil?
      if parent.nil?
        node.value = nil
      else
        parent.remove_child node
      end
    elsif !node.left.nil? && !node.right.nil?
      next_bigger_node = node.right.find_min
      if next_bigger_node == node.right
        node.value = node.right.value
        node.right = node.right.right
      else
        next_bigger_value = next_bigger_node.value
        remove next_bigger_value
        node.value = next_bigger_value
      end
    else
      child_node = node.left || node.right

      if parent.nil?
        self.class.copy_node child_node, node
      else
        parent.replace_child node, child_node
      end
    end

    node.parent = nil
    true
  end
end
