# Find majority element(if exists) in a given array.
# A majority element in an array A[] of size n is an element that appears more than n/2 times 

=begin
  * Find the candidate:
  1. set up candidate = arr[0], count = 1
  2. iterate through the array:
    decrement count if element != candidate
    if count = 0 => candidate <- element and count <- 1
    increment count otherwise
  * Count the candidate, if the number > n/2 => majority element
  1. iterate through the array, count the occurence of candidate
=end
# Time: O(n) + O(n) ≡ O(n)
# Space: O(1)
def find_candidate(a=[])
  candidate = a[0]
  count = 0
  a.each do |e|
    if e != candidate
      count -= 1
    else
      count += 1
    end
    if count == 0
      candidate = e
      count = 1
    end
  end
  candidate
end
def majority_element(a=[])
  candidate = find_candidate(a)
  p "candidate: #{candidate}"
  votes = 0
  a.each do |e|
    if e == candidate
      votes += 1
    end
  end
  return candidate if votes > (a.length/2)
  return -1
end
p majority_element([2,3,9,2,2])
p majority_element([1,2,3,4])
p majority_element([2,2,3,5,2,3])