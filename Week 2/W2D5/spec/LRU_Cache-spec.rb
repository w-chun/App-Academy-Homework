require 'LRU_cache'

describe LRUCache do
  subject(:cache) {LRUCache.new(4)}

  describe '#initialize' do
    it 'creates an empty array' do
      expect(cache.cache).to eq([])
    end
  end

  describe '#count' do
    it 'returns the number of elements in the cache' do
      cache.add(3)
      cache.add(1)
      expect(cache.count).to eq(2)
    end
  end

  describe '#add' do
    it 'adds an element to cache' do
      cache.add(5)
      cache.add(3)
      cache.add(7)
      expect(cache.cache).to eq([5,3,7])
    end

    it 'removes the first element in if the count is greater than the size of array' do
      cache.add(5)
      cache.add(3)
      cache.add(7)
      cache.add(8)
      cache.add(9)
      expect(cache.cache).to eq([3,7,8,9])
    end
  end

  describe '#show' do
    it 'shows the items in cache, with the LRU item first' do
      expect(cache.show).to eq(cache.cache)
    end
  end
end
