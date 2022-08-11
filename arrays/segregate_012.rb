#Given an array A[] consisting 0s, 1s and 2s, put all 0s first, then all 1s and all 2s in last.
# Time: O(n)
# Space: O(1)
=begin
  use 2 pivots called left <- 0 and right <- end index
  choose 1 as the pivot element
  forward pass:
    if iterator < 1: swap iterator versus array[left]
    increment left
    repeat till the end of array
  backward pass:
    if iterator > 1: swap iterator versus array[right]
    decrement right
    repeat till the end of array
=end
def segregate(a)
  left = 0
  right = a.length-1
  for i in 0...a.length
    if a[i] < 1
      a[i],a[left] = a[left], a[i]
      left += 1
    end
  end
  for i in Array(0...a.length).reverse
    if a[i] > 1
      a[i],a[right] = a[right], a[i]
      right -= 1
    end
  end
  a
end
p segregate([0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1])