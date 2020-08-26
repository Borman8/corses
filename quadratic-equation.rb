puts "Введите значение стороны a"
a = gets.chomp.to_i

puts "Введите значение стороны b"
b = gets.chomp.to_i

puts "Введите значение стороны c"
c = gets.chomp.to_i

discriminant = b**2 - 4 * a * c


if discriminant > 0
	x1 = (-b + Math.sqrt(discriminant))/2 * a
	x2 = (-b - Math.sqrt(discriminant))/2 * a
	puts "Корни уравнения x1=#{x1} и x2=#{x2} и дискриминант:#{discriminant}"
elsif discriminant == 0
	puts "x1 = x2 и равен #{x1} и дискриминант:#{discriminant}"
else
	puts "Корней нет"
end