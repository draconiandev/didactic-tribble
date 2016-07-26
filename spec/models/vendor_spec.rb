require 'rails_helper'

RSpec.describe Vendor, type: :model do
  it 'has a valid factory' do
    expect(build(:vendor)).to be_valid
  end

  let(:vendor) { build(:vendor) }

  describe 'ActiveModel validations' do
    #Presence Validations
    it { expect(vendor).to validate_presence_of(:name) }
    it { expect(vendor).to validate_presence_of(:address) }
    it { expect(vendor).to validate_presence_of(:phone) }
    it { expect(vendor).to validate_presence_of(:email) }
    #Format Validations
    it { expect(vendor).to allow_value('Kunthi Betta').for(:name) }
    it { expect(vendor).to allow_value(' #2, 1st Floor, Prasanna Sita Rama Mandir Building, Opp. Girnar Plaza, NS Road, Mysore, India').for(:address) }
    # Inclusion/acceptance of values
    it { expect(vendor).to validate_length_of(:name).is_at_least(3) }
  end

  describe 'ActiveRecord db columns' do
    it { expect(vendor).to have_db_column(:name).of_type(:string) }
    it { expect(vendor).to have_db_column(:address).of_type(:text) }
    it { expect(vendor).to have_db_column(:contact_person).of_type(:string) }
    it { expect(vendor).to have_db_column(:phone).of_type(:string) }
    it { expect(vendor).to have_db_column(:email).of_type(:string) }
  end

  describe 'ActiveRecord associations' do
    it { expect(vendor).to have_many(:activities) }
    it { expect(vendor).to have_many(:subscriptions) }
    it { expect(vendor).to have_many(:categories) }
  end
end
