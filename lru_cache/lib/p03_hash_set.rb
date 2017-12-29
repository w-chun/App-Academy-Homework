require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      @count += 1
      if @count > num_buckets
        resize!
      end
      self[key].push(key)
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 1
    new_store.each do |bucket|
      bucket.each do |el|
        self.insert(el)
      end
    end
  end
end
