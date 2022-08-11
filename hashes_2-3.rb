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
columns = dictionary.values.map { |words| words.values }.transpose
# => [[eins, one, uno],[zwei, two, dos], [drei, three, tres]]

# The purpose is to obtain the length of the longest word in each column
widths = columns.map do |column| #for each column
  column.max_by { |word| word.length }.length #get the elm whose length is the greatest, then extract its length
end
# => [4,4,5]

lines = languages.keys.map do |key| #for each key in language
  words = dictionary[key].values #words is the set of values of dictionary to which key maps
  words = words.map.with_index { |word, ix| word.ljust(widths[ix]) }
=begin
  for each value, we left adjust it based on the length of longest word in each column.
=end
  "#{key} #{words.join(' ')}"
end
puts lines.join("\n")

=begin
  de eins zwei drei
  en one  two  three
  es uno  dos  tres
=end