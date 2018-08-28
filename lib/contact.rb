class Contact
  @@contacts = []
  @@next_id = 1

  attr_accessor :first_name, :last_name, :job_title, :company, :contact_type, :id

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
    @id = @@next_id
  end

  def self.all()
    @@contacts
  end

  def self.find(id)
    @@contacts.find {|contact| contact.id() == id}
  end

  def save()
    @@contacts.push(self)
    @@next_id += 1
  end
end
