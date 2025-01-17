module Enumerable
  # Your code goes here
  def my_each_with_index
    counter = 0
    self.my_each do |element|
      yield(element, counter)
      counter += 1
    end
  end

  def my_select
    select = []
    self.my_each do |element|
      select << element if yield(element)
    end

    select
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
  
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end

    false
  end

  def my_none?(&block)
    !self.my_any? &block
  end

  def my_count
    return self.size unless block_given?

    count = 0
    self.my_each do |element|
      count += 1 if yield(element)
    end

    count
  end

  def my_map
    result = []
    self.my_each do |element|
      result << yield(element)
    end
    
    return result
  end

  def my_inject(initial)
    result = initial
    self.my_each do |element|
      result = yield(result, element)
    end

    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.length.times do |i|
      yield self[i]
    end

    self
  end
end
