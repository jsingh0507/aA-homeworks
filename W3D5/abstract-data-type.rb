#Exercise 1
class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end
  
  def push(el)
    # adds an element to the stack
    @stack << el
  end
  
  def pop
    # removes one element from the stack
    @stack.pop
  end
  
  def peek
    # returns, but doesn't remove, the top element in the stack
    @stack[-1]
  end
  attr_reader :stack
end

#Exercize 2
class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue.first
  end
  attr_reader :queue
end

#Exercise 3

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    if (pair_index = @map.find { |pair| pair[0] == key })
      @map[pair_index][1] = value
    else
      @map.push([key, value])
    end
    value
  end

  def get(key)
    pair = @map.find { |pair| pair[0] == key }
    if pair
      return pair[1]
    else
      return nil
    end
  end

  def delete(key)
    @map.delete_if { |pair| pair[0] == key }
  end

  def show
    deep_dup(@map)
  end

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end

  attr_reader :map
end