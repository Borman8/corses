letters = ('a'..'z').to_a
alphabet = Hash.new(0)

#n = 1
#letters.each do |x|
#  alphabet[x] += n
#  n += 1
#end


names = ["Vasya", "Kolya", "Petya"]

letters.each_with_index do |letter, index|
  alphabet[letter] = index + 1
end

puts alphabet