puts "Добрый день, как вас зовут?"
user_name = gets.chomp

puts "#{user_name}, какой у вас вес?"
weight = gets.chomp.to_i

ideal_weight = (weight - 110) * 1.15
if ideal_weight <= 0
  puts "#{user_name}, ваш вес уже оптимальный"
else
  puts "#{user_name}, надобы схуднуть"
end