dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :es => { :one => 'uno', :two => 'dos', :three => 'tres' }
}
languages = {
  :de => 'German',
  :en => 'English',
  :es => 'Spanish',
}

=begin
@IDEA:
  
  obtain the length of the longest word in each column
  into an array called widths,
  pad strings based on widths.
  
=end
  
# obtain a nested list whose element list represents a column
  
columns = dictionary.values.map { |lang| lang.values}.transpose

# find the length of the longest word in each column, append to array "widths"
widths = columns.map do |column|
  column.max_by { |word| word.length }.length
end
# use center("widths[index]*2 because if equal to string len then no padding") to pad strings in each row
lines = languages.keys.map do |key|
  words = dictionary[key].values
  words = words.map.with_index { |word,idx| word.center(widths[idx]*2)}
  "\|#{key.to_s.center(2*2)}\|#{words.join("|")}\|"
end
puts lines.join("\n")


=begin
| de | eins | zwei | drei  |
| en | one  | two  | three |
| es | uno  | dos  | tres  |
=end