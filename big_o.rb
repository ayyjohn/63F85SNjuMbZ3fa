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

def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end

# the constant factor here will change but the overall time complexity and space complexity
# are the same, because a constant factor change on time doesn't change the overall value,
# despite the fact that this function will only ever do half the printing.
# constant factor is 5/2, if, equality, length, division, and subtraction, but also the function
# will always stop halfway through the array.

