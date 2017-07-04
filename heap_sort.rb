# Heap sort is an in place algorithm that will always run in O(n*logn) time. 
# The main downside is that it suffers from complexity issues in terms of the
# associated code to execute it, in that merge sort and quicksort are generally
# very simple to show, whereas heap sort can be complex to get correct.

# a heap is an abstract data structure in which, for a min heap, for example,
# all children of an element are greater than their parent, IE the topmost
# element is the minimum element. To accomplish this, whenever an element is
# inserted it is inserted in the lowest-most, right-most position, and then
# "heapified up" to its correct position, IE if is swapped with its parent
# until its parent is less than or equal to it. This can actually be
# implemented in practice in two ways, both with a node-tree structure, or an
# array that represents this node-tree structure implicitly because of indices.
# for example the root node is the first element, and then its children
# follow to the right, at positions 1 and 2. To find an arbitrary element's
# children you can go to the indices 2n + 1 and 2n + 2. To find an arbitrary
# element's parent you can go to index (n - 1) / 2.

# a heap has 3 methods, peek, which shows the min/max element depending on if
# it's a min/max heap, insert, which puts a new value into the heap and
# ensures that the heap stays valid, and
# pop which removes the min/max element and ensures that the heap stays valid

# heap sort constitutes first in place turning the array into a heap, IE
# iterating over the array, and inserting each element into a heap that holds
# the first n - 1 items, then finally iterating over the heap and popping off
# each value of the heap. If done with a max heap this results in a sorted array

# creates a heap within an array, arr, of size n, rooted at index i
def heapify(arr, n, i)
  largest = i
  left_index = 2 * i + 1
  right_index = 2 * i + 2

  largest = left_index if left_index < n && arr[i] < arr[left_index]
  largest = right_index if right_index < n && arr[largest] < arr[right_index]

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
end

def heapsort(arr)
  n = arr.length
  n.downto(0).each { |i| heapify(arr, n, i) }

  (n - 1).downto(1).each do |i|
    arr[i], arr[0] = arr[0], arr[i]
    heapify(arr, i, 0)
  end
end

a = (0..20).to_a.shuffle
heapsort(a)
p a
