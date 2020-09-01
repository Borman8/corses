numbers = (10..100).to_a

numbers.each do |x|
  if (x % 5) == 0
    puts x
  end
end

puts "---------------------------------------"

number2 = (10..100).to_a
number2.delete_if { |a| (a % 5)  != 0 }
puts number2
