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

# ------------Solution-------------
  # result = BinaryMinHeap.new
  # k.times do
  #   result.push(array.pop)
  # end
  # until array.empty?
  #   result.push(array.pop)
  #   result.extract
  # end
  # result.store
end
