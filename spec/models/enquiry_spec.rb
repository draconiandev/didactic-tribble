describe Enquiry, type: :model do
  it 'has a valid factory' do
    # expect(build(:enquiry)).to be_valid
  end

  let(:enquiry) { build(:enquiry) }

   describe 'ActiveModel validations' do
    #Presence Validations
    it { expect(enquiry).to validate_presence_of(:name) }
    it { expect(enquiry).to validate_presence_of(:email) }
    it { expect(enquiry).to validate_presence_of(:phone) }
    #Format Validations
    it { expect(enquiry).to allow_value('Ashok Kumar').for(:name) }
    it { expect(enquiry).to allow_value('a@a.tld').for(:email) }
    it { expect(enquiry).to_not allow_value('a.tld').for(:email) }
    it { expect(enquiry).to_not allow_value('a@a').for(:email) }
    it { expect(enquiry).to allow_value('08041139495').for(:phone) }
    it { expect(enquiry).to_not allow_value('123').for(:phone) }
    it { expect(enquiry).to_not allow_value('abcd').for(:phone) }
  end

   describe 'ActiveRecord db columns' do
    it { expect(enquiry).to have_db_column(:name).of_type(:string) }
    it { expect(enquiry).to have_db_column(:message).of_type(:text) }
    it { expect(enquiry).to have_db_column(:phone).of_type(:string) }
    it { expect(enquiry).to have_db_column(:email).of_type(:string) }
  end

  describe 'ActiveRecord associations' do
    it { expect(enquiry).to belong_to(:activity) }
  end

  describe 'callbacks' do
    it { expect(enquiry).to callback(:save_attributes).before(:save) }
  end
end
