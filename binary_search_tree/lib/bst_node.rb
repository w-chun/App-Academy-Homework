class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent

  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  def replace_child(child, node)
    if child == @left.value
      @left = node
    elsif child == @right.value
      @right = node
    end
  end
end
