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
          set(current_bucket_node.data)
          current_bucket_node = current_bucket_node.next_node_pointer
        end
    end
  end

  def index(key)
    index = hash(key) % capacity
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
end

class Node
  attr_accessor :key, :value, :next_node_pointer

  def initialize(key, value, next_node_pointer = nil)
    @key= key
    @value = value
    @next_node_pointer = next_node_pointer
  end
end
