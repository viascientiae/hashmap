class HashMap
  attr_reader :buckets, :load_factor

  def initialize
    @buckets = Array.new(16)
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    check_load_factor
    insert(key, value)
  end

  def insert(key, value)
    bucket = index(key)
    if @buckets[bucket].nil?
      @buckets[bucket] = LinkedList.new(key, value)
    else
      position = @buckets[bucket].find(key)
      if position
        @buckets[bucket].change_data(value, position)
      else
        @buckets[bucket].append(key, value)
      end
    end
  end

  def check_load_factor
    new_buckets_list if load >= load_factor
  end

  def load
    non_empty_buckets / capacity.to_f
  end

  def non_empty_buckets
    nil_buckets = @buckets.count { |bucket| bucket.nil? }
    capacity - nil_buckets
  end

  def capacity
    @buckets.length
  end

  def new_buckets_list
    old_buckets = @buckets
    new_capacity = capacity * 2
    @buckets = Array.new(new_capacity)
    old_buckets.each do |bucket|
      next if bucket.nil?
      current_bucket_node = bucket.head_node
        while current_bucket_node != nil
          set(current_bucket_node.key, current_bucket_node.value)
          current_bucket_node = current_bucket_node.next_node_pointer
        end
    end
  end

  def index(key)
    index = hash(key) % capacity
  end

  def get(key)
    bucket = index(key)
    linkedlist = @buckets[bucket]
    if linkedlist
      index_of_key = linkedlist.find(key)
      linkedlist.at(index_of_key)
    else
      nil
    end
  end

  def key?(key)
    bucket = index(key)
    linkedlist = @buckets[bucket]
    if linkedlist
      index_of_key = linkedlist.find(key)
      if index_of_key
        true
      end
    else
      false
    end
  end

  def remove(key)
    if key?(key)
      bucket = index(key)
      linkedlist = @buckets[bucket]
      index_of_key = linkedlist.find(key)
      value = linkedlist.at(index_of_key)
      linkedlist.remove_at(index_of_key)
      value
    else
      nil
    end
  end

  def length
    length = 0

    @buckets.each do |bucket|
      length += bucket.size if bucket != nil
    end

    length
  end

  def clear
    @buckets = Array.new(capacity)
  end

  def keys
    keys = Array.new
    @buckets.each { |bucket| keys << bucket.list_keys if bucket != nil }
    keys.flatten!
  end

  def values
    values = Array.new
    @buckets.each { |bucket| values << bucket.list_values if bucket != nil }
    values.flatten!
  end

  def entries
    entries = Array.new
    @buckets.each { |bucket| entries << bucket.list_entries if bucket != nil }
    entries
  end
end

class LinkedList
  attr_accessor :key, :value, :head_node

  def initialize(key, value)
    @key = key
    @value = value
    @head_node = Node.new(key, value)
  end

  def append(key, value)
    current_node = @head_node
    while current_node.next_node_pointer != nil
      current_node = current_node.next_node_pointer
    end
    current_node.next_node_pointer = Node.new(key, value)
  end

  def find(key)
    index = 0
    current_node = @head_node

    while current_node
      return index if current_node.key == key
      current_node = current_node.next_node_pointer
      index += 1
    end

    nil
  end

  def change_data(value, position)
    index = 0
    current_node = @head_node

    while current_node && index < position
      current_node = current_node.next_node_pointer
      index += 1
    end

    current_node.value = value if current_node
  end

  def at(index)
    counter = 0
    current_node = @head_node

    while counter != index
      current_node = current_node.next_node_pointer
      counter += 1
    end

    current_node.value
  end

  def remove_at(index)
    counter = 0
    current_node = @head_node

    if index == 0
      @head_node = current_node.next_node_pointer
      current_node = nil
    else
      while counter <= index - 2
        current_node = current_node.next_node_pointer
        counter += 1
      end

      current_node.next_node_pointer = current_node.next_node_pointer.next_node_pointer
    end

  end

  def to_s
    string = ""
    current_node = @head_node

    while current_node != nil
      string += "( #{current_node.key}, #{current_node.value} ) -> "
      current_node = current_node.next_node_pointer
    end

    string += "nil"
    string
  end

  def size
    counter = 0
    current_node = @head_node

    while current_node != nil
      counter += 1
      current_node = current_node.next_node_pointer
    end

    counter
  end

  def list_keys
    keys = Array.new
    current_node = @head_node

    while current_node != nil
      keys << current_node.key
      current_node = current_node.next_node_pointer
    end

    keys
  end

  def list_values
    values = Array.new
    current_node = @head_node

    while current_node != nil
      values << current_node.value
      current_node = current_node.next_node_pointer
    end

    values
  end

  def list_entries
    entries = Array.new
    current_node = @head_node

    while current_node != nil
      entries << current_node.key
      entries << current_node.value
      current_node = current_node.next_node_pointer
    end

    entries
  end
end

class Node
  attr_accessor :key, :value, :next_node_pointer

  def initialize(key, value, next_node_pointer = nil)
    @key= key
    @value = value
    @next_node_pointer = next_node_pointer
  end
end
