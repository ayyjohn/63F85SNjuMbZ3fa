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
    break if idx == arr.length / 2 - 1
    puts el
  end
end

# the constant factor here will change but the overall time complexity and space complexity
# are the same, because a constant factor change on time doesn't change the overall value,
# despite the fact that this function will only ever do half the printing.
# constant factor is 5/2, if, equality, length, division, and subtraction, but also the function
# will always stop halfway through the array.

def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length / 2 - 1
    puts el
  end
end

# same as the previous function, without the constant factor over 2, because this one varies.
# in the best case it exits at the first value, and at the worst case it exits at the end,
# but depending on the array it changes so the big O is linear.

def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length / 2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end

# treat this as the sum of 3 independent things.
# first, only the first each loop will break
# if it hits the mark, so it's the same as the previous function
# for that part. then the next each block will iterate over
# each item and do everything except print on everything, so another O(n)
# with a constant factor. Finally the last portion is O(1).

def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end

# this is a linear search, the time complexity of which is best case
# the first index, and worst case the last index, so O(n)

def searchity_search(arr, target)
  results = []

  arr.each do |el|
    results << search(arr, target + el)
  end

  results
end

# this function performs a linear search for a semi random element on the original
# array n times, so the order is n^2

