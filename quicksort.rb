# quicksort can be done in place and not in place, and choosing a random
# pivot or the first element, either one, though generally random
# is preferable because of the chance of sorted inputs

class Array
  def quicksort
    return self if self.length <= 1
    pivot = self[0]
    left = self.drop(1).select { |el| el <= pivot }
    right = self.drop(1).select { |el| el > pivot }

    left.quicksort + [pivot] + right.quicksort
  end
end

a = (0..5).to_a.shuffle
p a.quicksort

# this method is fine, however with a sorted input will
# produce a worst case scenario. a better approach is to select a random pivot
