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
  In German, eins means one, zwei means two, drei means three.
  In Spanish, uno means one, duo means two, tres means three.
=end
deutsch = dictionary[:de]
print "In German"
deutsch.each do |key,val|
  if key == :three
    print ", #{val} means #{key}.\n"
  else
    print ", #{val} means #{key}"
  end
end
espanol = dictionary[:es]
print "In Spanish"
espanol.each do |key,val|
  if key == :three
    print ", #{val} means #{key}."
  else
    print ", #{val} means #{key}"
  end
end