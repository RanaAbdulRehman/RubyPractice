# # Ruby program of Include and Extend
  
# # Creating a module contains a method
# module Geek
#     def geeks
#       puts 'GeeksforGeeks!'
#     end
#   end
     
#   class Lord
    
#     # only can access geek methods
#     # with the instance of the class.
#     include Geek
#   end
     
#   class Star
      
#     # only can access geek methods
#     # with the class definition.
#     extend Geek
#   end
     
#   # object access 
#   Lord.new.geeks
    
#   # class access
#   Star.geeks 
    
#   # NoMethodError: undefined  method
#   # `geeks' for Lord:Class
#   Lord.geeks 

p (1..5)