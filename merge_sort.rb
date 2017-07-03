# Merge sort is another common sorting algorithm that is notably useful
# in conjunction with quicksort for when consistency is crucial. Whereas
# quicksort's runtime can vary, merge sort will ALWAYS run in O(n*log(n))
# time, while at the cost of taking up linear space

class Array
  def mergesort
    p self
    return self if self.length <= 1
    middle = self.length / 2
    left = self.take(middle)
    right = self.drop(middle)
    Array.merge(left.mergesort, right.mergesort)
  end

  def self.merge(arr1, arr2)
    # merges two sorted arrays into one large sorted array
    result = []
    until arr1.empty? || arr2.empty?
      if arr1.first <= arr2.first
        result << arr1.shift
      else
        result << arr2.shift
      end
    end
    result + arr1 + arr2
  end
end

a = (1..20).to_a.shuffle
p a.mergesort
