
#Concat 
=begin
puts "Rana".concat(" Abdul Rehman")
first_name = "Rana"
last_name = " Abdul Rehman"
name = first_name.concat(last_name)
puts name 
=end

#Upcase 
=begin
name = "RANA"
puts name.upcase
print (name)
= end 

=begin
1. If i put exclamation mark at the end of upcase it will change the original string
2. upcase! returns nil if nothing is changed in the string after the upcase!
3. downcase is similar to upcase but it converts to downcase
=end

=begin
country = "United States"
puts country.delete("e")
=end
# Delete is not inplace 


#replace 

=begin
player = "Messi"
player.replace("Ronaldo")
puts player
=end

#capitalize 

=begin
name = "messi"
puts name.capitalize
=end

#reverse 

# fruit = "desserts"
# print fruit.reverse


#length
# player = "Messi"
# puts player.length


#strip 

# msg  = "   Hello welcome to my life  "
# puts msg.rstrip 


#gsub 
# country = "United States"
# puts country.gsub("States", "Kingdom")