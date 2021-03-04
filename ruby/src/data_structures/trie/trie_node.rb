require_relative '../hash_table/hash_table'

class TrieNode
  attr_accessor :is_complete
  attr_reader :character, :children

  def initialize(character, is_complete = false)
    @character = character
    @is_complete = is_complete
    @children = HashTable.new
  end

  def add_child(character, is_complete = false)
    @children.set character, TrieNode.new(character, is_complete) unless @children.key? character

    child_node = @children.get character
    child_node.is_complete = child_node.is_complete || is_complete
    child_node
  end

  def suggest_children
    @children.keys
  end

  def children?
    !@children.keys.empty?
  end

  def child?(character)
    @children.key? character
  end

  def child(character)
    @children.get character
  end

  def remove_child(character)
    child_node = child character
    return self if child_node.nil? || child_node.is_complete || child_node.children?

    children.delete character
  end

  def to_s
    children_as_string = suggest_children.join(',')
    children_as_string = children_as_string != '' ? ":#{children_as_string}" : children_as_string
    complete_string = is_complete ? '*' : ''

    "#{@character}#{complete_string}#{children_as_string}"
  end
end
