require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[(@start_idx + index) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    @store[(@start_idx + @length) % capacity]
  end

  # O(1) ammortized
  def push(val)
    resize! if @length >= @capacity
    @store[(@start_idx + @length) % @capacity] = val
    @length += 1
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    @store[(@start_idx - 1) % @capacity]
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length >= @capacity
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index > @length - 1
  end

  def resize!
    temp = StaticArray.new(@capacity * 2)
    (0...@length).each do |i|
      temp[i] = @store[(@start_idx + i) % capacity]
    end

    @start_idx = 0
    @capacity = @capacity * 2
    @store = temp
  end
end
