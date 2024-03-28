# O(n^2) time
def quadratic_func(fish)
    longest_fish = nil
    (0...fish.length).each do |i|
        is_longest = true
        (0...fish.length).each do |j|
            if i!=j && fish[j].length > fish[i].length
                is_longest = false
                break
            end
        end
        if is_longest
          longest_fish = fish[i]
        end
    end
    longest_fish
end
# p quadratic_func(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# O(n log n)
class Array
    #this should look familiar
    def merge_sort(&prc)
      prc ||= Proc.new { |x, y| x <=> y }
      return self if count <= 1
      midpoint = count / 2
      sorted_left = self.take(midpoint).merge_sort(&prc)
      sorted_right = self.drop(midpoint).merge_sort(&prc)  
      Array.merge(sorted_left, sorted_right, &prc)
    end

    private
    def self.merge(left, right, &prc)
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

# below the code where we call merge sort
def nlogn_complex(fishes)
    prc = Proc.new { |x, y| y.length <=> x.length }
    fishes.merge_sort(&prc)[0]
end
# p nlogn_complex(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

#O(n) time
def linear_complex(fish)
    i = 1
    max = fish.first
    while i < fish.length
        if max.length < fish[i].length
            max = fish[i]
        end
        i+=1
    end
    max 
end
# p linear_complex(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

# linear octopus dance
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]
def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, index|
      return index if tile == direction
    end
end
# p slow_dance(up, tiles_array) 

# constant octopus dance
# use a hash for constant lookup
# tiles_hash = {
#     "up" => 0,
#     "right-up" => 1,
#     "right"=> 2,
#     "right-down" => 3,
#     "down" => 4,
#     "left-down" => 5,
#     "left" => 6,
#     "left-up" => 7
# }

def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end
# p fast_dance(up, tiles_array) 
