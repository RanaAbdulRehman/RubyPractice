# class Dog
#     def name(name)
#         puts "I am #{name}"
#     end
#     def playing
#         puts "I am Playing "
#     end
#     def eating
#         puts "I am Eating "
#     end
#     def sleeping
#         puts "I am Sleeping "
#     end
# end

# dog = Dog.new
# dog.name("Jack")
# dog.playing
# dog.eating
# dog.sleeping

$var = 10

class Book
    def initialize(title,author,pages)
        @title = title
        @author = author
        @pages = pages
    end
end

book1 = Book.new("The Alchemist","Poelho Coelho",120)
puts $var

# @@ To create static variables
# $ to Create global variable inside a class