class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2}
  end

  def count
    @store.count
  end

  def extract
    val = @store[0]
    @store[0] = @store[count - 1]
    @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count, &prc)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    BinaryMinHeap.heapify_up(@store, count - 1, @prc)
  end

  public
  def self.child_indices(len, parent_index)
    result = []
    left_child = (2 * parent_index) + 1
    right_child = (2 * parent_index) + 2
    result = [left_child, right_child]
    result.select {|idx| idx < len}
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    children = []
    left = self.child_indices(len, parent_idx)[0]
    right = self.child_indices(len, parent_idx)[1]
    children << array[left] if left
    children << array[right] if right
    if children.all? { |child| prc.call(array[parent_idx], child) <= 0 }
      return array
    end

    child_idx = nil
    if children.count == 1
      child_idx = left
    else
      child_idx = prc.call(children[0], children[1]) < 0 ? left : right
    end

    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
    else
      array
    end

    self.heapify_down(array, child_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx == 0
    parent_idx = self.parent_index(child_idx)
    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      self.heapify_up(array, parent_idx, len, &prc)
    else
      array
    end
  end
end
