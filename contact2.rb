class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  def initialize(id, first_name, last_name, options = {})
    @id = id
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

  #remove a contact from the list
  def self.delete(id)
    @@contacts.delete_if {|contact| contact.id == id}

  end

  #iterate through all contacts and find the one with the corresponding id
  def self.find(id)
    @@contacts.find {|contact| contact.id = id}
  end

  #display all contacts
  def self.all
    @@contacts
  end

  #delete all contacts
  def self.delete_all
    @@contacts == []
    @@id = 1
  end

  #search by attribute
  def self.search (name, value)
    @@contacts.select {
      |contact|
      if name == "first_name"
        value == contact.first_name
      elsif name == "last_name"
        value == contact.last_name
      elsif name == "email"
        value == contact.email
      elsif name == "note"
        value ==contact.note
      else
        value == nil
      end
    }
  end
    #update
    def update(name, value)
      case name
      when "first_name"
        @first_name = value
      when "last_name"
        @last_name = value
      when "email"
        @email = value
      when "note"
        @note = value
      end
    end
end
