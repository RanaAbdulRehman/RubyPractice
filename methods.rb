def isEven(num)
    return num%2
end

def add(num1,num2)
    total = num1+num2
    total
end

if isEven(9) == 0
    print("Even")
else
    print("Odd")
end
puts
puts add(2,5)

#Method returns the last line if you don't write the return statement


# Pass by Value
# 1. Int 2. Float 3. Bool 
# Pass by reference 
# 1. String. 2. Hash  3. Array

#If we return more than one value it's like an array


#Method with default value

def prog_language(pl1 = "C++",pl2)
    puts "Programming Language 1 is : #{pl1}"
    puts "Programming Language w is : #{pl2}"
end

prog_language("Java","Python")
prog_language("Ruby")
