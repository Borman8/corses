user_input  = {}
user_input2 = {}
price_for_items = {}
full_count = 0

loop do 
  puts "Введите назваине товара:"
  name_item = gets.chomp
  break if name_item == "стоп"

  puts "Введите цену товара:"
  price_item = gets.chomp.to_i

  puts "Введите количество товара:"
  count_item = gets.chomp.to_f

  user_input = { price_item => count_item }
  user_input2[name_item] = user_input
  price_for_items[name_item] = user_input

  user_input.each do |x,y|
    price_for_items[name_item] = x * y
    full_count += price_for_items[name_item].to_f
  end
end

#puts user_input
puts "Весб хэш: #{user_input2}"
puts "-----------------------------"
puts "Итоговая цена за каждый товар: #{price_for_items}"
puts "-----------------------------"
puts "Полнацая цена покупок: #{full_count}"

