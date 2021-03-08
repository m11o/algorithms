require_relative '../binary_search_tree/binary_search_tree'

# これむずくね？(git commitテスト)
# AAAA
# ああ
class RedBlackTree < BinarySearchTree
  COLOR_PROP_NAME = 'color'.freeze
  RED_BLACK_TREE_COLORS = {
    red: :red,
    black: :black
  }.freeze

  def insert(value)
    inserted_node = super value

    if inserted_node == @root
      attach_black! inserted_node
    else
      attach_red! inserted_node
    end

    balance inserted_node
    inserted_node
  end

  def remove(value)
    raise NotImplementedError
  end

  def node_red?(node)
    return false if node.nil?

    node.meta.get(COLOR_PROP_NAME) == RED_BLACK_TREE_COLORS[:red]
  end

  def node_black?(node)
    return false if node.nil?

    node.meta.get(COLOR_PROP_NAME) == RED_BLACK_TREE_COLORS[:black]
  end

  def node_colored?(node)
    node_black?(node) || node_red?(node)
  end

  private

  def balance(node)
    return if node == @root
    return if node_black? node.parent

    grand_parent = node.parent.parent
    if node.uncle && node_red?(node.uncle)
      attach_black! node.uncle
      attach_black! node.parent

      return if grand_parent == @root

      attach_red! grand_parent
      balance grand_parent
    elsif node.uncle.nil? || node_black?(node.uncle)
      return if grand_parent.nil?

      new_grand_parent = if grand_parent.left == node.parent
                           if node.parent.left == node
                             rotate_left_left grand_parent
                           else
                             rotate_left_right grand_parent
                           end
                         else
                           if node.parent.right == node
                             rotate_right_right grand_parent
                           else
                             rotate_right_left grand_parent
                           end
                         end

      if new_grand_parent && new_grand_parent.parent.nil?
        @root = new_grand_parent
        attach_black! @root
      end

      balance new_grand_parent
    end
  end

  def rotate_left_left(grand_parent_node)
    grand_grand_parent_node = grand_parent_node.parent
    grand_parent_node_is_left = grand_grand_parent_node && grand_grand_parent_node.left == grand_parent_node

    parent_node = grand_parent_node.left
    parent_right_node = parent_node.right

    parent_node.right = grand_parent_node
    grand_parent_node.left = parent_right_node

    if grand_grand_parent_node
      grand_parent_node_is_left ? grand_grand_parent_node.left = parent_node : grand_grand_parent_node.right = parent_node
    else
      parent_node.parent = nil
    end

    swap_node_colors parent_node, grand_parent_node
    parent_node
  end

  def rotate_left_right(grand_parent_node)
    parent_node = grand_parent_node.left
    child_node = parent_node.right
    child_left_node = child_node.left

    child_node.left = parent_node
    parent_node.right = child_left_node
    grand_parent_node.left = child_node

    rotate_left_left grand_parent_node
  end

  def rotate_right_right(grand_parent_node)
    grand_grand_parent_node = grand_parent_node.parent
    grand_parent_node_is_left = grand_grand_parent_node && grand_grand_parent_node.left == grand_parent_node

    parent_node = grand_parent_node.right
    parent_left_node = parent_node.left

    parent_node.left = grand_parent_node
    grand_parent_node.right = parent_left_node

    if grand_grand_parent_node
      grand_parent_node_is_left ? grand_grand_parent_node.left = parent_node : grand_grand_parent_node.right = parent_node
    else
      parent_node.parent = nil
    end

    swap_node_colors parent_node, grand_parent_node
    parent_node
  end

  def rotate_right_left(grand_parent_node)
    parent_node = grand_parent_node.right
    child_node = parent_node.left
    child_right_node = child_node.right

    child_node.right = parent_node
    parent_node.left = child_right_node
    grand_parent_node.right = child_node

    rotate_right_right grand_parent_node
  end

  def attach_red!(node)
    node.meta.set(COLOR_PROP_NAME, RED_BLACK_TREE_COLORS[:red])
    node
  end

  def attach_black!(node)
    node.meta.set(COLOR_PROP_NAME, RED_BLACK_TREE_COLORS[:black])
    node
  end

  def swap_node_colors(first_node, second_node)
    first_color = first_node.meta.get COLOR_PROP_NAME
    second_color = second_node.meta.get COLOR_PROP_NAME

    first_node.meta.set COLOR_PROP_NAME, second_color
    second_node.meta.set COLOR_PROP_NAME, first_color
  end
end
