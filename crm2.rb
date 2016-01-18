require_relative 'contact2.rb'

class CRM
  def self.run(name)
    crm = CRM.new(name)
    crm.main_menu

  end

  def initialize(name)
    @name = name
  end

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
    puts "4. Display a contact attribute"
    puts "5. Delete a contact"
    puts "6. Exit"

  end

  def choose_option(choice)
    case choice
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_all
    when 4 then display_attribute
    when 5 then delete_contact
    when 6
      puts "Thanks for using the CRM app!"
      exit
    else
      puts "Sorry, that is not a valid option. Please choose a valid option."
    end

  end

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

    new_contact = Contact.create(first_name, last_name, email, note)

    puts "New contact created."

  end

  #update a contact
  def modify_contact
    puts "Please enter the id of the contact you would like to modify:"
    modify_id = gets.chomp.to_i
    puts "Is this the id of the contact you would like to modify (ex. yes or no)?"
    confirm = gets.chomp.to_s

    if confirm == "yes"
      user_choice = select_attribute
      puts "Please enter the new value:"
      value = gets.chomp
      updated_contact = Contact.find(modify_id).update(user_choice, value)

    else confirm == "no"
      main_menu
    end

  end

  #display all contacts
  def display_all
    Contact.all.each do |contact|
      show(contact)
    end
  end

  def show(contact)
    puts "#{contact.id} #{contact.first_name} #{contact.last_name} #{contact.email} #{contact.note}"
  end

  #select attribute
  def select_attribute
    puts "Please select which attribute you would like to view based on the following numbers:"
    puts "1. First Name"
    puts "2. Last Name"
    puts "3. Email"
    puts "4. Notes"
    name = gets.chomp.to_i

    case name
    when 1
      then name = "first_name"
    when 2
      then name = "last_name"
    when 3
      then name = "email"
    when 4
      then name = "note"
    end
    return name
  end

    def display_attribute
    user_choice = select_attribute

    puts "Please enter the value you would like to view:"
    value = gets.chomp


    match = Contact.search(user_choice, value)
    match.each do |contact|
    show(contact)
    end
  end

  #delete a contact
  def delete_contact
    puts "Enter the id of the contact you would like to delete:"
    id = gets.chomp.to_i
    Contact.delete(id)
    display_all
  end


end

CRM.run "Contacts_App"
