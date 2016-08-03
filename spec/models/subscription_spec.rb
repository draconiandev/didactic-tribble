describe Subscription, type: :model do

  it 'has a valid factory' do
    expect(build(:subscription)).to be_valid
  end

  let(:subscription) { build(:subscription) }

  describe 'ActiveRecord databases' do
    it { expect(subscription).to have_db_column(:vendor_id).of_type(:integer) }
    it { expect(subscription).to have_db_column(:category_id).of_type(:integer) }
  end

  describe 'ActiveRecord associations' do
    it { expect(subscription).to belong_to(:vendor) }
    it { expect(subscription).to belong_to(:category) }
  end
end
