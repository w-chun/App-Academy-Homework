require_relative "heap"

class Array
  def heap_sort!
    arr = BinaryMinHeap.new
    self.length.times do
      arr.push(self.shift)
    end
    until arr.store.count == 0
      self.push(arr.extract)
    end

# ------------MinHeap Solution-------------------
    # 2.upto(count).each do |heap_sz|
    #   BinaryMinHeap.heapify_up(self, heap_sz - 1, heap_sz)
    # end
    #
    # count.downto(2).each do |heap_sz|
    #   self[heap_sz - 1], self[0] = self[0], self[heap_sz - 1]
    #   BinaryMinHeap.heapify_down(self, 0, heap_sz - 1)
    # end
    #
    # self.reverse!
  end
end
