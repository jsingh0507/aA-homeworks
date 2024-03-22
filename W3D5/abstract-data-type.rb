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

