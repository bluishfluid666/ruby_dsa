#Given an array of 0s and 1s in random order.Segregate 0s on left side and 1s on right side of the array.

# Dutch National Flag algorithm
# Time: O(n)
# Space: O(1)

=begin
  Make use of the pivot and the iterator pointer
  Choose 1 as our pivot element
  if we hit element < 1, swap the value to which iterator points and the pivot's
  increment the pivot
  repeat over the array
=end
def swap(a,b)
  a = a+b
  b = a - b
  a = a - b
end
def segregate(a)
  pivot = 0
  for i in 0...a.length
    if a[i] < 1
      a[i], a[pivot] = a[pivot], a[i]
      pivot += 1
    end
  end
  a
end
p segregate([0,1,1,0,1,0,1,1,0,0,0,0,1])