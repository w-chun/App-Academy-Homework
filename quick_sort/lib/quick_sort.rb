class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    pivot = array.first
    return array if array.length <= 1
    left = array[1..-1].select{|el| el <= pivot}
    right = array[1..-1].select{|el| el > pivot}
    self.sort1(left) + [pivot] + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    pivot = partition(array, start, length, &prc)
    sort2!(array, start, pivot - start, &prc)
    sort2!(array, pivot + 1, length - pivot - 1, &prc)
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x,y| x <=> y }
    pivot = array[start]
    barrier = start + 1
    i = barrier
    while i < (start + length)
      if prc.call(array[i], pivot) < 0
        array[i], array[barrier] = array[barrier], array[i]
        barrier += 1
        i += 1
      else
        i += 1
      end
    end
    array[start], array[barrier - 1] = array[barrier - 1], array[start]
    barrier - 1
  end
end
