fib = [0, 1]
i = 0 # инкременент 
n = 0 # F(0) = 0
x = 1 # F(1) = 1
while i <= 100
fib_sum = fib[n-1] + fib[x-2]
  n +=1

  fib.push(fib_sum)
end
puts fib

# 2 вариант 

fibonacci_arr = [0, 1]                        

while fibonacci_arr[-1] < 88                  
  fibonacci_arr.push(fibonacci_arr[-1] + fibonacci_arr[-2])
end

puts fibonacci_arr