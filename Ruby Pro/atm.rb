module Bank

    class User
        attr_accessor :name, :email, :ph_no , :cnic , :balance, :acc_no

        def initialize(acc_no,name,email,ph_no,cnic,balance)
            @name = name
            @email = email
            @ph_no = ph_no
            @cnic = cnic
            @balance = balance
            @acc_no = acc_no
        end

        def print
            p "Account # : #{acc_no}"
            p "Name : #{name}"
            p "Email : #{email}"
            p "Phone # : #{ph_no}"
            p "CNIC : #{cnic}"
            p "Balance : #{balance}"
        end
    end


    class FileInputOutput
    
        def self.write_user(user)
            if !user_exists?(user)
                file = File.new("user.txt",'a')
                file.puts("#{user.acc_no}\t#{user.name}\t#{user.email}\t#{user.ph_no}\t#{user.cnic}\t#{user.balance}\n")
                p "Your Account have been Signed Up "
                file.close()
            else
                p "Account No Already Exist "
            end
        end

        def self.read_all_users
            users = Array.new
            File.open("user.txt", "r").each_line do |line|
                data = line.split(/\t/)
                users.append(User.new(data[0].to_i,data[1],data[2],data[3],data[4],data[5].to_f))
            end
            return users
        end

        def self.user_exists?(acc_no)
            File.open("user.txt", "r").each_line do |line|
                data = line.split(/\t/)
                if data[0].to_i == acc_no
                    return true
                end
            end
            return false
        end

        def self.write_all_users(users)
            file = File.new("user.txt",'w+')
            users.each do |user|
                file.puts("#{user.acc_no}\t#{user.name}\t#{user.email}\t#{user.ph_no}\t#{user.cnic}\t#{user.balance}\n")
            end
            file.close
        end
        
    end

    class ATM
        @@user_list = []

        def initialize
            @@user_list = FileInputOutput.read_all_users
        end
        
        def create_account
            random = Random.new
            print "Enter Name : "
            name = gets.chomp

            while true
                acc_no  = random.rand(10000)
                if !FileInputOutput.user_exists?(acc_no)
                    break
                end
                puts "Account No. Already Exists. Generating New Account No. "
            end

            email = ""
            while true
                print "Enter Email : "
                email = gets.chomp
                if email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
                   break
                end
                puts "Wrong Email Format" 
            end

            ph_no = ""
            while true
                 print "Enter Ph. # : "
                 ph_no = gets.chomp() 
                 if ph_no =~ /[0-9]{11}/
                    break
                 end
                 puts "Must be exactly 11 digits"
            end

            cnic = ""
            while true
                 print "Enter CNIC : "
                 cnic = gets.chomp() 
                 if cnic =~ /[0-9]{13}/
                    break
                 end
                 puts "Must be exactly 13 digits"
            end

            print "Enter Balance for your account : "
            balance = gets.chomp.to_f

            user = User.new(acc_no,name,email,ph_no,cnic,balance)
            FileInputOutput.write_user(user)
            @@user_list.append(user)
        end

        def balance_enquiry
            print "Enter Your Account # : "
            acc_no = gets.chomp.to_i
            user = search_user(acc_no)
            if user != nil
                puts "Your Balance is : #{user.balance}"
            else
                puts "No such account exist"
            end

        end

        def withdraw_money
            print "Enter Account Number : "
            acc_no = gets.chomp.to_i
            if search_user(acc_no) != nil
                print "How much money you wanna withdraw : "
                withdrawn_amount = gets.chomp.to_i
                @@user_list.collect! { |user|
                    new_user = nil
                    if acc_no == user.acc_no
                        if user.balance > withdrawn_amount
                            user.balance = user.balance - withdrawn_amount
                            puts "Cash Withdrawn Successfully. Remaining Balance : #{user.balance}"
                            new_user = User.new(user.acc_no,user.name,user.email,user.ph_no,user.cnic,user.balance)
                        else
                            puts "Not Enough Balance"
                            new_user = user
                        end
                        new_user
                    else
                        user
                    end
                }
            else
                print("No such account exists")
            end
            FileInputOutput.write_all_users(@@user_list)
        end

        def deposit_money
            print "Enter Account Number : "
            acc_no = gets.chomp.to_i
            if search_user(acc_no) != nil
                print "How much money you wanna deposit : "
                deposit_amount = gets.chomp.to_i
                @@user_list.collect! { |user|
                    new_user = nil
                    if acc_no == user.acc_no
                        user.balance = user.balance + deposit_amount
                        puts "Cash Deposited Successfully. Remaining Balance : #{user.balance}"
                        new_user = User.new(user.acc_no,user.name,user.email,user.ph_no,user.cnic,user.balance)
                        new_user
                    else
                        user
                    end
                }
            else
                print("No such account exists")
            end
            FileInputOutput.write_all_users(@@user_list)
        end

        def transfer_money
            user_from = nil
            user_to = nil
            from = 0
            to = 0
            while true
                print "Enter Your Account # : "
                from = gets.chomp.to_i
                user_from = search_user(from)
                if user_from != nil
                    break
                end
                puts "No Such Account Exists"
            end
            while true
                print "Enter Account # to which you want to deposit money : "
                to = gets.chomp.to_i
                user_to = search_user(to)
                if user_to != nil
                    break
                end
                puts "No Such Account Exists"
            end
            print "How much money you want to transfer : "
            transfer_money = gets.chomp.to_i
            if transfer_money <= user_from.balance
                user_to.balance = user_to.balance + transfer_money
                user_from.balance = user_from.balance - transfer_money
                puts "Transaction Successful"
            else
                puts "You don't have enough money"
            end

            @@user_list.collect! { |user|
                if user.acc_no == user_to.acc_no
                    user_to
                elsif user.acc_no == user_from.acc_no
                    user_from
                else
                    user
                end
            }
            FileInputOutput.write_all_users(@@user_list)
        end

        def delete_account
            while true
                print "Enter Account Number you want to delete : "
                acc_no = gets.chomp.to_i
                user = search_user(acc_no)
                if user != nil
                    break
                end
                puts "No such account exists"
            end
            @@user_list.delete_if{|usr| usr.acc_no == user.acc_no}
            puts "Account Deleted Successfully"
            FileInputOutput.write_all_users(@@user_list)
        end

        def update_account_ph_no
            while true
                print("Enter Account # : ")
                from = gets.chomp.to_i
                user = search_user(from)
                if user != nil
                    break
                end
                puts "No Such Account Exists"
            end
            ph_no = ""
            while true
                 print "Enter New Ph. # : "
                 ph_no = gets.chomp() 
                 if ph_no =~ /[0-9]{11}/
                    break
                 end
                 puts "Must be exactly 11 digits"
            end
            user.ph_no = ph_no
            @@user_list.collect!{ |usr|
                if user.acc_no == usr.acc_no
                    user
                else
                    usr
                end
            }
            FileInputOutput.write_all_users(@@user_list)
        end

        private
        def search_user(acc_no)
            @@user_list.each do |user|
                if user.acc_no == acc_no
                    return user
                end
            end
            return nil
        end
    end
end