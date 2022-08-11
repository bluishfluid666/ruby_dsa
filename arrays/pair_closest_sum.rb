# array of integers(both +ve and -ve) find the two elements such that their sum is closest to given number x.

=begin
IDEA:
  - We check if there is any pair matching the sum in the array first, if there is, return it.
  - Sort the array
  - Find smallest sum and greatest sum and check if the given sum is in range:
    + If it's out of range rightward (greater than our greatest sum) => the greatest sum
    + If it's out of range leftward (smaller than our smallest sum) => the smallest sum
    + If it's in range, init left ptr <- 0, right ptr <- end index, min_diff <- ∞:
      (abolished) 1st while loop moving the right pointer until it is equal to the left pointer, push the smallest diff in array[2].  
      (abolished) 2nd while loop moving the left pointer until it is equal to the right pointer, push the smallest diff in array[2].
      - Return array[:1]
      => incorrect approach
      Correct approach:
      1. find their diff, min_diff = |diff| if |diff| < min_diff
      2. if their diff < 0, it tells you that the current sum < the given sum, and we need something closer,
      so we can only choose to increment the left pointer to point to a greater number
      3. if their diff > 0, it tells you that the current sum > the given sum, equivalenly we can only choose
      to decrement the right pointer to point a smaller number, so our sum matches closer to the given sum
      4. repeat 1 -> 3 until the left pointer = right pointer
=end
  
def closest_sum(a=[], given_sum)
  a.sort!
  smallest = a[0] + a[1] #smallest sum 
  # p smallest
  greatest = a[-1] + a[-2] #greatest sum
  # p greatest
  return a[0], a[1] if smallest > given_sum
  return a[-1], a[-2] if greatest < given_sum
  l_ptr = min_l = 0
  r_ptr = min_r = a.length - 1
  min_diff = Float::INFINITY
  until l_ptr == r_ptr
    diff = (a[l_ptr] + a[r_ptr]) - given_sum
    if diff.abs < min_diff
      min_l = l_ptr
      min_r = r_ptr
      min_diff = diff.abs
    end
    if diff < 0
      l_ptr += 1
    else
      r_ptr -= 1
    end
  end
  return a[min_l], a[min_r]
end


# def closest_sum(a,x)
#   a.sort!               #You can choose any sorting algorithm of your choice with
#   left=min_l=0
#   right=min_r=a.length-1
#   min_diff = Float::INFINITY     #Initializing min_diff with infinity
#   while(left<right)
#     diff = (a[left]+a[right])-x
#     p diff
#     if diff.abs < min_diff
#         min_diff = diff.abs
#         min_l = left
#         min_r = right
#     end
#     if diff < 0 # this tells you that our current sum < the given sum
#         left+=1 # so we need to increment the left pointer to a greater number
#     else #otherwise we need to decrement to a smaller number
#       # so that our sum is closer to the given sum,
#       # because it is currently greater than the given sum.
#         right-=1
#     end
#   end
#     print " The two elements whose sum is minimum are #{a[min_l]} and #{a[min_r]}"   
# end
# p closest_sum([-5,-2,-1,3,6], 3)
p closest_sum([5,7,3,8,10], 14)
p closest_sum([1,3,2,4,5], 9)
p closest_sum([3,6,2,12], 11)
p closest_sum([4,5,7,6], 20)
p closest_sum([1,2,3,4], 10)
# 3,5,7,8,10
=begin
  
  a = [1,3,2,4,5]
  x = 9
  => 4,5
  
  a = [5,7,3,8,10]
  x = 14
  => 5,10 or 5,8

  a = [3,6,2,12]
  x = 11
  => 3,6

  a = [4,5,7,6]
  x = 20
  => 7,6

  a = [1,2,3,4]
  x = 10
  => 3,4

  a = [7,8,13,14,16]
  x = 11
  => 7,8

  a = [-5,-1,3,-2,6]
  x = -2
  => -5,3

  a = [-5,-1,3,-2,6]
  x = -4
  => -5,3
  
=end