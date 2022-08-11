languages = {
  :de => 'German',
  :en => 'English',
  :es => 'Spanish',
}
dictionary = {
  :de => { :one => 'eins', :two => 'zwei', :three => 'drei' },
  :en => { :one => 'one', :two => 'two', :three => 'three' },
  :es => { :one => 'uno', :two => 'dos', :three => 'tres' }
}
=begin
  de eins zwei drei
  en one two three
  es uno dos tres
=end
dictionary.each do |key, val|
  print "#{key} "
  val.each do |nested_key, nested_val|
    print "#{nested_val} "
  end
  print "\n"
end