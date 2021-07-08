require_relative "moduleseperate.rb"
include BigSample

obj = BigSample::SampleA.new


class HelloUse
    include Hello1 # If that module contained a class, There would have been an error because we can't include a class in a class. 
    include Hello2 
    include Hello3
    include Hello4
    def hello5
        puts "Hello 5"
    end
end

obj1 = HelloUse.new
obj1.hello1
