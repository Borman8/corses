puts "Введите основания треугольника"
a = gets.chomp.to_f 

puts "Введите высоту треугольника"
h = gets.chomp.to_f 

area = 0.5 * a * h
  puts "Площадь треугольника равна: 0.5 * #{a} * #{h} = #{area}"