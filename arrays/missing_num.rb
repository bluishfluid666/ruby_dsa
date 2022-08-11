#Ruby magic:
# Subtract one array from another to see their diff.
# Time: O(1) 
# Space: O(n)
def missing_num(arr)
  n = arr.max
  range = Array(1...n)
  missing = range - arr
end

puts missing_num([1,5,2,4,6])