require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new()
  string.chars.each do |letter|
    if map.include?(letter)
      map[letter] += 1
    else
      map[letter] = 1
    end
  end

  nums = 0
  map.each do |link, val|
    if val.odd?
      nums += 1
    end
  end
  nums <= 1
end
