require_relative "atm.rb"

def menu
    puts "\n\n\n\n\n"
    puts "\t\t\t1. Create a new Account"
    puts "\t\t\t2. Balance Enquiry"
    puts "\t\t\t3. Withdraw Money"
    puts "\t\t\t4. Deposit Money"
    puts "\t\t\t5. Transfer Money"
    puts "\t\t\t6. Update Phone # "
    puts "\t\t\t7. Delete Account "
    atm = Bank::ATM.new()
    while true
        print "What do you want to do : "
        input = gets.chomp
        case input
        when "1"
            atm.create_account
            break
        when "2"
            atm.balance_enquiry
            break
        when "3"
            atm.withdraw_money
            break
        when "4"
            atm.deposit_money
            break
        when "5"
            atm.transfer_money
            break
        when "6"
            atm.update_account_ph_no
            break
        when "7"
            atm.delete_account
            break
        else
            p "Wrong Input"    
        end
    end
end

menu()