def add(a, b)
  if a > b
    return a + b
  end

  a - b
end

# the time complexity is O(1), with a constant factor of 4. if, >, +/-, return
# the space complexity is O(1), the function will only ever use 2 numbers as memory
