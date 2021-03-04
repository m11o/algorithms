require_relative 'trie_node'

class Trie
  attr_reader :head

  HEAD_CHARACTER = '*'.freeze

  def initialize
    @head = TrieNode.new HEAD_CHARACTER
  end

  def add_word(word)
    parent_node = head
    char_size = word.size
    word.chars.each_with_index do |character, index|
      parent_node = parent_node.add_child character, index == (char_size - 1)
    end
    self
  end

  def delete_word(word)
    node = head
    word.chars.each.with_index(0) do |char, index|
      child_node = node.child char
      return self if child_node.nil?

      if word.size == index + 1
        child_node.is_complete = false
      end

      node.remove_child char
      node = child_node
    end

    # _delete word, head # 再帰的な解決方法
    self
  end

  def exist_word?(word)
    node = last_character_node word
    return false if node.nil?

    node.is_complete
  end

  def suggest_next_characters(word)
    node = last_character_node word
    return if node.nil?

    node.suggest_children
  end

  private

  def _delete(word, node, char_index = 0)
    return if char_index >= word.size

    character = word[char_index]
    next_node = node.child character

    return if next_node.nil?

    _delete word, next_node, char_index + 1

    if char_index == word.size - 1
      next_node.is_complete = false
    end

    next_node.remove_child character
  end

  def last_character_node(word)
    node = head
    word.chars.each do |char|
      node = node.child char
      return if node.nil?
    end

    node
  end
end
