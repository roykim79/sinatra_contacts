require 'rspec'
require 'contact'


describe Contact do
  before :each do
    @contact = Contact.new({
      :first_name => 'John',
      :last_name => 'Doe',
      :job_title => 'Manager',
      :company => 'ACME Inc',
      :contact_type => 'business'
    })
  end

  describe '#initialize' do
    it 'sets the attributes of the new contact' do
      expect(@contact.first_name()).to eq('John')
      expect(@contact.last_name()).to eq('Doe')
      expect(@contact.job_title()).to eq('Manager')
      expect(@contact.company()).to eq('ACME Inc')
      expect(@contact.contact_type()).to eq('business')
    end
  end

  describe '#first_name=' do
    it 'changes the value of first_name' do
      @contact.first_name = 'Mike'
      expect(@contact.first_name()).to eq('Mike')
    end
  end

  describe '#last_name=' do
    it 'changes the value of last_name' do
      @contact.last_name = 'Smith'
      expect(@contact.last_name()).to eq('Smith')
    end
  end

  describe '#job_title=' do
    it 'changes the value of job_title' do
      @contact.job_title = 'Director'
      expect(@contact.job_title()).to eq('Director')
    end
  end

  describe '#company=' do
    it 'changes the value of company' do
      @contact.company = 'AAA Inc'
      expect(@contact.company()).to eq('AAA Inc')
    end
  end

  describe '#contact_type=' do
    it 'changes the value of contact_type' do
      @contact.contact_type = 'personal'
      expect(@contact.contact_type()).to eq('personal')
    end
  end
end
