puts File.exist?("F")

file = File.new("output.txt",'w')
file.puts("I've written data in the file.")
file.close()
