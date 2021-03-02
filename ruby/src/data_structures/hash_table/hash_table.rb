require_relative '../linked_list/linked_list'

class HashTable
  attr_reader :buckets

  def initialize(buckets_length = 32)
    @buckets = Array.new(buckets_length).map { LinkedList.new }
    @keys = {}
  end

  def hash(key)
    hash = key.chars.inject(0) do |accumulator, value|
      accumulator += value.ord
      accumulator
    end

    hash % buckets.size
  end

  def set(key, value)
    hash = hash key
    @keys[key] = hash

    addressed_link = buckets[hash]
    node = addressed_link.find { |node_value| node_value[:key] == key }

    if node.nil?
      addressed_link.append key: key, value: value
    else
      node.value[:value] = value
    end
  end

  def get(key)
    hash = hash key
    addressed_list = buckets[hash]
    return if addressed_list.empty?

    result = addressed_list.find { |value| value[:key] == key }
    return if result.nil?

    result.value[:value]
  end

  def key?(key)
    @keys.key? key
  end

  def keys
    @keys.keys
  end

  def values
    values = []
    buckets.each do |bucket|
      next if bucket.nil?

      values.concat bucket.to_a.map { |value| value[:value] }
    end
    values
  end

  def delete(key)
    hash = hash key
    addressed_link = buckets[hash]
    return if addressed_link.nil?

    node = addressed_link.find { |value| value[:key] == key }
    return if node.nil?

    addressed_link.delete node.value
    @keys.delete key
  end
end
