def getDayName(day)
    day_name = ""
    case day
    when "mon"
        day_name = "Monday"
    when "tue"
        day_name = "Tuesday"
    when "wed"
        day_name = "Wednesday"
    when "thurs"
        day_name = "Thursday"
    when "fri"
        day_name = "Friday"
    when "sat"
        day_name = "Saturday"
    when "sun"
        day_name = "Sunday"
    else
        day_name = "Invalid"
    end
end

def getComments(grade)
    case grade
    when "A+","A","A-"
        puts "Excellent"
    when "B+","B","B-"
        puts "Good"
    when "C"
        puts "Satisfactory"
    else
        puts "Unsatisfactory"
    end
end

def getNumInRange(num)
    case num 
    when 1..100
        puts("Low")
    when 101..200
        puts("Medium")
    when 201..300
        puts("High")
    else
        puts("...")
    end
end


puts getDayName("mon")
getComments("A+")
getNumInRange(101)