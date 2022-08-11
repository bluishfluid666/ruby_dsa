PARENS = {
  "(" => ")",
  "{" => "}",
  "[" => "]"
}
OPENING = PARENS.keys
CLOSING = PARENS.values
=begin
  Check if all the parentheses in the string are balanced (matched w/eo)
  Examples:
    () => true
    [()] => true
    [[[()]]] => true
    [()(){} => false
    ()(){([])}] => false
    {([)}[] => false
  Edge cases:
    empty string => true
    no parens => true
  Time: O(s.length)
  Space: O(s.length)
=end
=begin
  1. create a stack to only store opening brackets
  2. if encounter a closing bracket:
      if stack.empty => false
      match stack.pop with it, if matched => continue, else => false
  3. repeat until the end of array
  4. if stack not empty => false
=end
def check_brackets(s="")
  return true if s.empty?
  s.each_char do |c|
    if OPENING.include?(c) or CLOSING.include?(c)
      break
    end
    return true
  end
  linter = Array.new
  s.each_char do |c|
    if OPENING.include? c
      linter.push c
      next
    end
    return false if linter.empty?
    return false if c != PARENS[linter.pop] 
  end
  return false if !linter.empty?
  return true
end
p check_brackets("(){}[]") # true
p check_brackets("[(])")   # false