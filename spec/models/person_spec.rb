describe Person, type: :model do
  it "has a valid factory" do
    expect(build(:person)).to be_valid
  end

  let(:person) { build(:person) }

  describe "ActiveModel validations" do
    #Presence Validations
    it { expect(person).to validate_presence_of(:name) }
    it { expect(person).to validate_presence_of(:email) }
    #Format Validations
    it { expect(person).to allow_value("Ramesh Suresh").for(:name) }
    it { expect(person).to_not allow_value("123").for(:name) }
    it { expect(person).to_not allow_value("123Abc").for(:name) }
    it { expect(person).to_not allow_value("Abc@ Asd").for(:name) }
  end
end
