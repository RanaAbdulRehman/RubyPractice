ismale = true

if ismale
    puts "You are male"
elsif !ismale 
    puts "You are not male"
else
    puts "Unreachable"    
end 
puts("Pakistan")


cgpa = -1 

if cgpa <= 4.0 && cgpa >= 3.4
    puts "Excellent"
elsif cgpa >=3.0 && cgpa < 3.4
    puts  "Satisfactory"
elsif cgpa >= 1.8 && cgpa < 3.0
    puts "UnSatisfactory"
elsif cgpa > 4 || cgpa < 0
    puts "Wrong cgpa entered" 
end