# product array where product[i] = product of all elements except a[i]
# Time: O(n)
# Space: O(n)

def product_arr(a)
  prod = 1
  product = Array.new
  a.each{ |e| prod *= e }
  a.each.with_index do |e,i|
    product << prod / a[i]
  end
  product
end
p product_arr([1,2,3,4,5,6])