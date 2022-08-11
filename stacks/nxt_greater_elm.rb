#Given an array of integers, print the next greatest element for each of the element
#Time-complexity:O(n),Auxiliary-space:O(n){stack}
=begin
Example
Input: [23,12,56,22,6,34]
Output:
  12 -> 56
  23 -> 56
  6 -> 34
  22 -> 34
  34 -> -1
  56 -> -1
Input: [2,3,1,5,10,10,8,15,17,19]
Output:
  2 -> 3
  3 -> 5
  1 -> 5
  5 -> 10
  10 -> 15
  10 -> 15
  8 -> 15
  15 -> 17
  17 -> 19
  19 -> -1
=end

=begin 
  Idea:
  1. push the first elm into stack
  2. if !stack.empty(), using "next" to progress through the remaining elms, starting from 2nd elm
  if next > stack.top(), "stack.pop() -> next",  until next <= stack.top() or stack.empty()
  3. push next into stack
  4. repeat 2. and 3. until the end of array
  5. if !stack.empty(), stack.pop() and assign each -1 until stack.empty()
=end

def nge(a) #nge: next greater element
  stck = Array.new
  stck.push a[0]
  a.each.with_index do |nxt, idx|
    if idx != 0
      until stck.empty? or nxt <= stck[-1]
        puts "#{stck.pop} -> #{nxt}"
      end
      stck.push nxt
    end
  end
  until stck.empty?
    puts "#{stck.pop} -> -1"
  end
end
nge([23, 12, 56, 22, 6, 34])