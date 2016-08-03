describe Contact, type: :model do
  it 'has a valid factory' do
    expect(build(:contact)).to be_valid
  end

  let(:contact) { build(:contact) }

   describe 'ActiveModel validations' do
    #Presence Validations
    it { expect(contact).to validate_presence_of(:name) }
    it { expect(contact).to validate_presence_of(:email) }
    it { expect(contact).to validate_presence_of(:phone) }
    #Format Validations
    it { expect(contact).to allow_value('Ashok Kumar').for(:name) }
    it { expect(contact).to allow_value('a@a.tld').for(:email) }
    it { expect(contact).to_not allow_value('a.tld').for(:email) }
    it { expect(contact).to_not allow_value('a@a').for(:email) }
    it { expect(contact).to allow_value('08041139495').for(:phone) }
    it { expect(contact).to_not allow_value('123').for(:phone) }
    it { expect(contact).to_not allow_value('abcd').for(:phone) }
  end
end
