#Given an array ,sort the array by descending order of count of element, 
#if count is same then the element which comes in array first comes first in sorted array.
#Time-complexity: O(nlogn) , Auxiliary-space: O(n) {for hash}


def sort_by_frequency(a)
  len=a.length
  freq=Hash.new() #Hash to store element,count and starting index
  for i in 0...len
  # Storing count and index in hash with element as the key
    unless freq[a[i]] #while freq[a[i]] is still nil
        freq[a[i]] = Hash.new
        freq[a[i]][:count] = 1 
        freq[a[i]][:index] = i
=begin
  {
    1 => {:count => 1, :index = 0}
  }
=end
    else
        freq[a[i]][:count] += 1
    end
  end
  
  freq=freq.sort_by{ |k,v| [-v[:count],v[:index]] } # Sort the hash by decreasing count value and if count is same then by index(starting index)
  p freq
  # freq=freq.sort_by{ |k,v| [-v[:count],k] } # Sort the hash by decreasing count value and if count is same then by the element's value
  # Iterate on hash
  it=0# Index to iterate over array
  freq.each do |k,v|
      for i in 0...v[:count]
        a[it]=k
        it+=1
      end  
  end
  return a
end
      

p sort_by_frequency([1,3,3,3,4,4,4,2,2,2,5]) # => [3, 3, 3, 4, 4, 4, 2, 2, 2, 1, 5]
# p sort_by_frequency([1,3,3,3,4,4,4,2,2,2,5,5,6,7,7,7,8,8]) # => [3, 3, 3, 4, 4, 4, 2, 2, 2, 7, 7, 7, 5, 5, 8, 8, 1, 6]