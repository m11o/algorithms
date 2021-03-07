require_relative '../binary_search_tree/binary_search_tree'

class AvlTree < BinarySearchTree
  def insert(value)
    super value

    node = root.find value
    while node
      balance node
      node = node.parent
    end
  end

  def remove(value)
    super value

    balance root
  end

  private

  def balance(node)
    if node.balance_factor > 1
      if node.left.balance_factor.positive?
        rotate_left_left node
      elsif node.left.balance_factor.negative?
        rotate_left_right node
      end
    elsif node.balance_factor < -1
      if node.right.balance_factor.negative?
        rotate_right_right node
      elsif node.right.balance_factor.positive?
        rotate_right_left node
      end
    end
  end

  def rotate_left_left(root_node)
    left_node = root_node.left
    root_node.left = nil

    if root_node.parent.nil?
      @root = left_node
    else
      root_node.parent.left = left_node
    end

    root_node.left = left_node.right if left_node.right
    left_node.right = root_node
  end

  def rotate_left_right(root_node)
    left_node = root_node.left
    root_node.left = nil

    left_right_node = left_node.right
    left_node.right = nil

    if left_right_node.left
      left_node.right = left_right_node.left
      left_right_node.left = nil
    end
    root_node.left = left_right_node
    left_right_node.left = left_node

    rotate_left_left root_node
  end

  def rotate_right_right(root_node)
    right_node = root_node.right
    root_node.right = nil

    if root_node.parent
      root_node.parent.right = right_node
    else
      @root = right_node
    end

    root_node.right = right_node.left if right_node.left
    right_node.left = root_node
  end

  def rotate_right_left(root_node)
    right_node = root_node.right
    root_node.right = nil

    right_left_node = right_node.left
    right_node.left = nil

    if right_left_node.right
      right_node.left = right_left_node.right
      right_left_node.right = nil
    end

    root_node.right = right_left_node
    right_left_node.right = right_node
    rotate_right_right root_node
  end
end
