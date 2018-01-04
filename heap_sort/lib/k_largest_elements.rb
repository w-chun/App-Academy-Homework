require_relative 'heap'

def k_largest_elements(array, k)
  sorted = []
  arr = BinaryMinHeap.new

  array.each do |num|
    arr.push(num)
  end

  until arr.count == 0
    sorted.unshift(arr.extract)
  end

  sorted[0...k]
end
