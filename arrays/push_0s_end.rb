#Given an array of random numbers, Push all the zero’s of a given array to the end of the array
#Time Complexity: O(n),Auxiliary Space: O(1)

def segregate_zeros(a)
  pivot = 0
  for i in 0...a.length
    if a[i] > 0
      a[i],a[pivot] = a[pivot],a[i]
      pivot+=1
    end
  end
  a
end
p segregate_zeros([1,2,0,3,0,4,0,5,0,0,6])
