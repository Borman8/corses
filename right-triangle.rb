puts "Введите значение стороны a"
a = gets.chomp.to_i

puts "Введите значение стороны b"
b = gets.chomp.to_i

puts "Введите значение стороны c"
c = gets.chomp.to_i

if a > b && a > c 
	puts "Гипотинуза равна: a:#{a}, и катеты b: #{b} и c: #{c}"
	hypotenuse = a
	catet1 = b
	catet2 = c
elsif b > a && b > c
	puts "Гипотинуза равна: b:#{b}, и катеты b: #{a} и c: #{c}"
	hypotenuse = b
	catet1 = a
	catet2 = c
else
	puts "Гипотинуза равна: c:#{c}, и катеты b: #{a} и c: #{b}"
	hypotenuse = c
	catet1 = a
	catet2 = b
end

if hypotenuse**2 == catet1**2 + catet2**2
	puts "Треугольник прямоугольный"
end

if a == b || b == c || c == a
	puts "Треугольник равнобедренный, со сторонами, a=#{a}, b=#{b}, c=#{c}"
end
	
if a == b && a == c
	puts "Треугольник и равнобедренный и равносторонний со сторонами, a=#{a}, b=#{b}, c=#{c}"
end