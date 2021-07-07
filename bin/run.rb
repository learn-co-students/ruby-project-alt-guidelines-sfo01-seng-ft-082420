require_relative "../config/environment"
require_relative "../app/models/user.rb"
require_relative "../app/models/locker.rb"
require_relative "../app/models/building.rb"

### This will happen first 

def welcome 
    puts "************************"
    puts "Welcome to Storage Land"
    puts "************************"
end 

### This will happen next 

def menu
    puts "~Please make a selection~"
    puts "1. Login"
    puts "2. Signup"
    puts "4. Update Name Info"
    puts "5. Update Locker Info"
    puts "5. Delete Account"
    puts "6. Suggestion Box "
    puts "7. Exit"
    
    user_input = gets.chomp
    if user_input.downcase == "login" 
        gets_user_login_info
    elsif user_input.downcase == "signup" 
        create_account
    elsif user_input.downcase == "update name info" 
        update_name_info
    elsif user_input.downcase == "update locker info"
        update_locker_info
    elsif user_input.downcase == "delete account"
        delete_user
    elsif user_input.downcase == "suggestion box"
        puts "************"
        puts "COMING SOON!"
        puts "************"
    elsif user_input.downcase == "exit"
        puts "***********************"
        puts "Smh YOU WILL BE BACK!"
        puts "***********************"
    else 
        puts "***********************"
        puts "Sorry didnt catch that."
        puts "***********************"
        menu
    end
end


def gets_user_login_info
    puts "********************************************"
    puts "Enter your name so you can see your lockers?"
    puts"*********************************************"
    name = gets.chomp
    get_user(name)
end


def create_account
    puts "****************************"
    puts "Thanks, Enter your name!"
    puts "****************************"
    user_input = gets.chomp
    user = User.create(name: user_input)
    create_account_locker(user)
end 


def create_account_locker(created_user) 
    puts "*********************************"
    puts "Now enter the name of your locker"
    puts "*********************************"

    user_input_locker_name = gets.chomp

    puts "*************************************"
    puts "Now enter the location of your locker"
    puts "*************************************"

    user_input_location = gets.chomp
    locker = Locker.create(name: user_input_locker_name, location: user_input_location)
    building = Building.create(user_id: created_user.id, locker_id: locker.id)

    puts "********************************************************************"
    puts "Perfect, you have completeed Storage Land's account opening feature!"
    puts "********************************************************************"
    menu
end



def update_name_info
    
    puts "*****************************"
    puts "Enter name to update profile!"
    puts "*****************************"

    user_input = gets.chomp
    
    if user = User.find_by(name: user_input)
        puts "*/*/*/*/*/*/*/*/*/*/*/*/*/*"
        puts "Enter your new profile name!"
        puts ""
        user_new_input = gets.chomp
        user.update(name: user_new_input)
        puts "**************************************"
        puts "Congrats you updated your profile name"
        puts "**************************************"

    else
        puts "**********************"
        puts "Sorry incorrect entry!"
        puts "**********************"
        update_info
    end

end 



def update_locker_info

    puts "*******************************"
    puts "Enter locker name to update it!"
    puts "*******************************"

    locker_name = gets.chomp

    puts "***********************************"
    puts "Enter locker location to update it!"
    puts "***********************************"

    locker_location = gets.chomp

    locker = Locker.find_by(name: locker_name, location: locker_location)
    if locker 
        puts "**************************"
        puts "Enter your new locker name"
        puts "**************************"

        new_locker_name = gets.chomp

        puts "****************************"
        puts "Enter your new location name"
        puts "****************************"

        new_locker_location = gets.chomp

        locker.update(name: new_locker_name)
        locker.update(location: new_locker_location)

        puts "*******************************************************************"
        puts "You have successfully changed the name and location of your locker!"
        puts "*******************************************************************"


    else
        puts "**********************"
        puts "Sorry incorrect entry!"
        puts "**********************"
        update_locker_info
    end
 

end


def delete_user
    puts"**************************************"
    puts"Enter your name so we can delete it!!"
    puts"**************************************"
    user_input = gets.chomp
    user = User.find_by(name:user_input)
    user.lockers.each{|locker| locker.destroy}
    user.destroy
    puts "Its gone along with all your belongings!!"
    puts ":("
end


def store_words_in_locker(user)
    user.lockers.each{|locker|
        puts "name: #{locker.name}"
        puts "location: #{locker.location}"
        puts "*******************"
        puts ""

    }
end



def get_user(user_name)
    user = User.find_by(name: user_name)
    if user 
        puts "~~~~~~~~~~~~~"
        puts 'Welcome back!'
        puts "~~~~~~~~~~~~~"
        store_words_in_locker(user)
    else
        puts ""
        puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        puts "Sorry, there is no user with that name, try again?"
        puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
        puts ""
        gets_user_login_info
    end

end


welcome
menu


# def create_account
#     puts "****************************"
#     puts "Thanks, Enter your name!"
#     puts "****************************"
#     user_input = gets.chomp
#     user = User.create(name: user_input)
#     create_account_locker(user)
# end 


# def create_account_locker(created_user) 
#     puts "*********************************"
#     puts "Now enter the name of your locker"
#     puts "*********************************"
#     user_input_locker_name = gets.chomp
#     puts "*************************************"
#     puts "Now enter the location of your locker"
#     puts "*************************************"
#     user_input_location = gets.chomp
#     locker = Locker.create(name: user_input_locker_name, location: user_input_location)
#     building = Building.create(user_id: created_user.id, locker_id: locker.id)
#     #binding.pry
#     puts "********************************************************************"
#     puts "Perfect, you have completeed Storage Land's account opening feature!"
#     puts "********************************************************************"
#     menu
# end

# def delete_user
#     puts"**************************************"
#     puts"Enter your name so we can delete it!!"
#     puts"**************************************"
#     user_input = gets.chomp
#     user = User.find_by(name:user_input)
#     user.lockers.each{|locker| locker.destroy}
#     user.destroy
#     puts "Its Gone"
# end



# def gets_user_login_info
#     puts "********************************************"
#     puts "Enter your name so you can see your lockers?"
#     puts"*********************************************"
#     name = gets.chomp
#     get_user(name)
# end

# def store_words_in_locker(user)
#     user.lockers.each{|locker|
#         puts "name: #{locker.name}"
#         puts "location: #{locker.location}"
#         puts "*******************"
#         puts ""

#     }
# end


# def get_user(user_name)
#     user = User.find_by(name: user_name)
#     if user 
#         puts "~~~~~~~~~~~~"
#         puts 'Welcome back'
#         puts "~~~~~~~~~~~~"
#         store_words_in_locker(user)
#     else
#         puts ""
#         puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
#         puts "Sorry, there is no user with that name, try again?"
#         puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
#         puts ""
#         gets_user_login_info
#     end

# end

# def update_name_info

#     puts "*****************************"
#     puts "Enter name to update profile!"
#     puts "*****************************"

#     user_input = gets.chomp

#     if user = User.find_by(name: user_input)
#         puts "Enter your new profile name"
#         user_new_input = gets.chomp
#         user.update(name: user_new_input)
#         puts "**************************************"
#         puts "Congrats you updated your profile name"
#         puts "**************************************"

#     else
#         puts "**********************"
#         puts "Sorry incorrect entry!"
#         puts "**********************"
#         update_info
#     end


# end

# welcome
# menu
