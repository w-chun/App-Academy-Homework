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
  end
end
