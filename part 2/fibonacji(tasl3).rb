fib = [0, 1]
i = 0 # инкременент 
n = 0 # F(0) = 0
x = 1 # F(1) = 1
while i <= 100
fib_sum = fib[n] + fib[x]
  i +=1
  n +=1
  x +=1
  fib.push(fib_sum)
end
puts fib
