require_relative 'contact.rb'

class CRM
  def initialize(name)
    @name = name

  end

  def print_main_menu
    puts "1. Add new contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Display a contact"
    puts "5. Display a contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"

  end

  def main_menu
    while true
    print_main_menu
    choice = gets.chomp.to_i
    choose_option
    end
  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all
    when 4 then display_contact
    when 5 then display_attribute
    when 6 then delete_contact
    when 7
      puts "Thanks for using the CRM app!"
      exit
    else
      puts "Sorry, that is not a valid option. Please choose a valid option."
    end

  end

  def add_contact
    puts "Please provide the contact's info:"
    puts "First Name:"
    first_name = gets.chomp.to_s

    puts "Last Name:"
    last_name = gets.chomp.to_s

    new_contact = Contact.create(first_name, last_name, email: email, note: note)

  end

  def display_all
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end

  end


end
