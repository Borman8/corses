puts "Введите значение стороны a"
a = gets.chomp.to_f

puts "Введите значение стороны b"
b = gets.chomp.to_f

puts "Введите значение стороны c"
c = gets.chomp.to_f

discriminant = b**2 - 4*a*c
if discriminant > 0
  y = Math.sqrt(discriminant)
  x1 = (-b + y)/2*a
  x2 = (-b - y)/2*a
  puts "Корни уравнения x1=#{x1} и x2=#{x2} и дискриминант:#{discriminant}"
elsif discriminant == 0
  x1 = -b(2*a)
  puts "x1 = x2 и равен #{x1} и дискриминант:#{discriminant}"
else
  puts "Корней нет"
end