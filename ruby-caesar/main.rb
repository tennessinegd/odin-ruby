# an array that represents the alphabet
# created quickly and easily using the splat operator and range syntax
ALPHABET = [*"a".."z"]

def is_upcase?(character)
  return character == character.upcase
end

def caesar_cipher(string, offset)
  # iterate over characters
  encryptedArray = string.chars.map do |char|
    # don't modify the character if it's not alphabetical
    next char unless ALPHABET.include? char.downcase
    # get character index and apply the offset, wrapping if necessary
    charIndex = ALPHABET.index(char.downcase)
    encryptedChar = ALPHABET[(charIndex + offset) % ALPHABET.length]
    # apply original case if needed
    encryptedChar = encryptedChar.upcase if is_upcase?(char)
    encryptedChar
  # join enumerable back into string
  end.to_a.join("")
end

puts "String:"
str = gets.chomp

puts "Offset:"
off = gets.to_i

puts caesar_cipher(str, off)
p ALPHABET