# Time: O(nlogn) for quick sorting
# Space: O(1)
def print_distinct(a=[])
  a.sort!
  a.each.with_index do |e,i|
    if e != a[i-1]
      print "#{e} "
    end
  end
end
print_distinct([4, 7, 4, 1, 1, 4, 8, 10, 6, 7])
print "\n"
# Time: O(n)
# Space: O(n)

def print_distinct(a=[])
  map = Hash.new
  a.each do |e|
    unless map[e]
      map[e] = 1
      print "#{e} "
    end
  end
end
print_distinct([4, 7, 4, 1, 1, 4, 8, 10, 6, 7])