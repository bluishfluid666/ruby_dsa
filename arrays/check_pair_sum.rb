#Given an array A[] and a number x, check for pair in A[] with sum as x

#Approach 1: Using Hash Map
#Time-complexity: O(n), Space-complexity: O(n) {extra space required for hashmap}

def check_pair(arr,sum)
  len=arr.length
  flag=false
  map=Hash.new
  arr.each do |el|
    t = sum - el
    if map[t]
      flag=true
      break
    end
    map[el]=1
  end
  if flag
      return "Array has two elements with sum:#{x}"
  else
      return "Array doesn't have two elements with sum:#{x}"
  end
end

p check_pair([5,4,10,-2,3,2,-1,9],9)


##Approach 2: Sorting and then searching using left and right indexes.
# Time-complexity: O(nlogn) //O(nlogn)+O(n) because Ruby's sort implements Quick Sort
# Space-complexity: O(1)
# Implement this when you can exchange time for space efficiency.
def check_pair(arr,x)
  len=arr.length
  arr.sort!           # You can choose your own sorting algorithm
  left=0
  right=len-1
  while left<right
      if (arr[left]+arr[right]==x)
          return "Array has two elements with sum:#{x}"
      elsif (arr[left]+arr[right]>x)
          right-=1
      else
          left+=1
      end
  end
  return "Array doesn't have two elements with sum:#{x}"
end

check_pair([5,4,10,-2,3,2,-1,9],9)