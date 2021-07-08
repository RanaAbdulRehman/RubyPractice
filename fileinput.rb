
file = File.new("input.txt",'r')
# file.each do |line|
#     puts line
# end
data = file.read
puts data
file.close()
