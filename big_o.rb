def add(a, b)
  if a > b
    return a + b
  end

  a - b
end

# the time complexity is O(1), with a constant factor of 4. if, >, +/-, return
# the space complexity is O(1), the function will only ever use 2 numbers as memory


def print_arr_1(arr)
  arr.each do |idx|
    puts idx
  end
end

# constant space, but linear time complexity. we don't assign any additional memory,
# but as the array grows we have to do a linear amount more of prints. constant
# factor of 1

