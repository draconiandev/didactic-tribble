describe Categorization, type: :model do

  it 'has a valid factory' do
    expect(build(:categorization)).to be_valid
  end

  let(:categorization) { build(:categorization) }

  describe 'ActiveRecord databases' do
    it { expect(categorization).to have_db_column(:activity_id).of_type(:integer) }
    it { expect(categorization).to have_db_column(:category_id).of_type(:integer) }
  end

  describe 'ActiveRecord associations' do
    it { expect(categorization).to belong_to(:activity) }
    it { expect(categorization).to belong_to(:category) }
  end
end
