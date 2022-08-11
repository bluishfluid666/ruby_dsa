=begin
Equilibrium index of an array is an index such that the sum of elements at lower indices is equal to the sum of elements at higher indices.
For example, in an array A:
A = [-7,1,5,2,-4,3,0]
3 is an equilibrium index, because:
A[0] + A[1] + A[2] = A[4] + A[5] + A[6]
Time-complexity: O(n)
Auxiliary-space: O(1)
=end
=begin
1. sum all array elements together -> right sum
2. left sum <- 0
3. iterate through the array:
    peele off right sum by each array element
    if 2 sums are equal => the index
    add to the left sum the equal amount of peeling-off.
4. => -1  
=end
def equilib_idx(a)
  r_sum = a.sum
  l_sum = 0
  a.each.with_index do |e,i|
    # puts "e:#{e} and i: #{i}"
    r_sum -= e
    # puts "r:#{r_sum}"
    if r_sum == l_sum
      return i
    end
    l_sum += e
    # puts "l:#{l_sum}"
    # puts "====="
  end
  return -1
end
p equilib_idx([-7,1,5,2,-4,3,0])