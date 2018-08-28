require 'rspec'
require 'contact'


describe Contact do
  describe '#initialize' do
    it 'sets the attributes of the new contact' do
      contact = Contact.new({
        :first_name => 'John',
        :last_name => 'Doe',
        :job_title => 'Manager',
        :company => 'ACME Inc',
        :contact_type => 'business'
      })
      expect(contact.first_name()).to eq('John')
      expect(contact.last_name()).to eq('Doe')
      expect(contact.job_title()).to eq('Manager')
      expect(contact.company()).to eq('ACME Inc')
      expect(contact.contact_type()).to eq('business')
    end
  end
end
