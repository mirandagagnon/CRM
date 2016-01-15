class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  def initialize(first_name, last_name, options = {})
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @note = options[:note]
  end

  @@contacts = []
  @@id = 1

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.create(first_name, last_name, options = {})
   #1. Create a new contact
   #2. Assign new contact a unique id
  new_contact = new(@@id, first_name, last_name, options) #Equivalent of calling Contact.new


    #3. Add new contact to the list
    @@contacts << new_contact

    #4. Increment the global id
    @@id += 1

    #5. Return contact that was created
    new_contact

  end

  #iterate through all contacts and find the one with the corresponding id
  def self.find(id)

    @@contacts.find {|contact| contact.id = id}
  end

  #display all contacts
  def self.all
    @@contacts
  end

end
