"Big O-ctopus and Biggest Fish"

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#bubble_sort
def sluggish_octopus(array)

  sorted = false
  until sorted
    sorted = true

    array.each_index do |i|
      next if i == array.length - 1
        if array[i].length > array[i+1].length
          array[i],array[i+1] = array[i+1],array[i]
          sorted = false
        end
      end
    end
    array.last

end

p sluggish_octopus(fishes)

#merge_sort
class Array
  def dominant_octopus(&prc)
    prc ||= Proc.new{|x,y| x<=>y}
    return self if self.length <= 1

    mid = self.length/ 2
    sorted_left = self.take(mid).dominant_octopus(&prc)
    sorted_right = self.drop(mid).dominant_octopus(&prc)

    Array.merged(sorted_left,sorted_right,&prc)
  end

  private

  def self.merged(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

p fishes.dominant_octopus{|x,y| x.length <=> y.length}[-1]

#each
def sluggish_octopus(array)
  biggest_fish = nil

  array.each do |el|
    biggest_fish = el
    if el.length > biggest_fish.length
      biggest_fish = el
    end
  end
  biggest_fish
end

p sluggish_octopus(fishes)


"Dancing Octopus"

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction,array)
  array.each_with_index do |el,i|
    return i if direction == el
  end
end

p slow_dance("up",tiles_array)
p slow_dance("right-down",tiles_array)

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(direction, data_structure)
  data_structure[direction]
end

p constant_dance("down", tiles_hash)
p constant_dance("left-down", tiles_hash)
