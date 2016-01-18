require_relative 'contact2.rb'

class CRM
  # def initialize(name)
  #   @name = name
  # end

  def main_menu
    while true
    print_main_menu
    choice = gets.chomp.to_i
    choose_option(choice)
    end
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


  # def self.run(name)
  #   crm = CRM.new(name)
  #   crm.main_menu
  # end


  #add a contact
  def add_contact
    puts "Please provide the contact's info:"
    puts "First Name:"
    first_name = gets.chomp.to_s

    puts "Last Name:"
    last_name = gets.chomp.to_s

    puts "Email:"
    email = gets.chomp.to_s

    puts "Notes:"
    note = gets.chomp.to_s

    new_contact = Contact.create(first_name, last_name, email: email, note: note)

    puts "New contact created."

  end

  #update a contact
  def modify_contact

  end

  #display all contacts
  def display_all
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end

  #display one contact
  def display_contact
    puts "Please enter the id of the contact you would like to view:"
    id = gets.chomp.to_s
    Contact.find(id)

  #delete a contact
  def delete_contact
    puts "Enter the id of the contact you would like to update:"
    id = gets.chomp.to_s
    Contact.delete(id)
  end


end

crm = CRM.new
crm.main_menu
