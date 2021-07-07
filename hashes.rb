#Just like a dictionary in python

colors = { "red" => 0xf00, "green" => 0x0f0, "blue" => 0x00f }
colors.each do |key, value|
 print key, " is ", value, "\n"
end 

colors["violet"] = 0x00c
puts(colors)
# Key => Value, Key => Value, Key => Value 
print colors.keys, colors.values

#Find key using the value

puts colors.key(0xf00)


#Creating an empty hash 

h = Hash.new
h["Alec"] = 3.4
h["Sam"] = 3.2
h["Smith"] = 3.3 

print h


h.each do |element|
    print element
end
puts
h.each do |key,value|
    print "Key = #{key} , Value = #{value}\n"
end

