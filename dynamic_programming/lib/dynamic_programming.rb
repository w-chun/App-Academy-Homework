class DynamicProgramming

  def initialize
    @blair_cache = {
      1 => 1,
      2 => 2
    }
    @frog_cache = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,1,1], [1,2], [2,1], [3]]
    }
    @super_frog_cache = {
      0 => [[]]
    }
  end

  def blair_nums(n)
    # return n if n < 3
    # blair_nums(n-1) + blair_nums(n-2) + ((2 * n) - 3)
    return @blair_cache[n] if @blair_cache[n]
    val = blair_nums(n-1) + blair_nums(n-2) + ((2 * n) - 3)
    @blair_cache[n] = val
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    frog_cache = @frog_cache.dup
    (4..n).each do |n|
      frog_cache[n] =
        frog_cache[n-1].map {|set| set + [1]} +
        frog_cache[n-2].map {|set| set + [2]} +
        frog_cache[n-3].map {|set| set + [3]}
    end
    frog_cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    @frog_cache[n] = []
    frog_hops_top_down_helper(n-1).each { |set| @frog_cache[n] << set + [1] }
    frog_hops_top_down_helper(n-2).each { |set| @frog_cache[n] << set + [2] }
    frog_hops_top_down_helper(n-3).each { |set| @frog_cache[n] << set + [3] }
    @frog_cache[n]
  end

  def super_frog_hops(n, k)
  
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
