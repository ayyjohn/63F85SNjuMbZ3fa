require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  # a string can be modified into a palindrome if and only if
  # all of its elements occur a multiple of two times, with the
  # exception of one element, if the number of letters is odd.
  # this is very similar to the xor, find the element that is
  # not repeated in an array that every other element is repeated
  # twice. 
  letter_counts = Hash.new(0)
  string.chars.each do |char|
    letter_counts[char] += 1
  end
  puts letter_counts
  if string.length % 2 == 0
    return letter_counts.all? { |_, count| count % 2 == 0 }
  else
    odds = 0
    letter_counts.each do |_, count|
      odds += 1 if count % 2 != 0
    end
    return odds == 1
  end
end
