# file = File.new("input.txt",'r')
# # file.each do |line|
# #     puts line
# # end
# data = file.read
# puts data
# file.close()


##################
# Exception Handling
begin
    file1 = File.open("inputx.txt",'r')
    puts file1.read()
    file1.close
rescue
    raise("File Not Found.Please Make sure to write correct file name")    
end
