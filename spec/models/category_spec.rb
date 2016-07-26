#
RSpec.describe Category, type: :model do
  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end

  let(:category) { build(:category) }

  describe 'ActiveModel validations' do
    #Presence Validations
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_presence_of(:description) }
    it { expect(category).to validate_presence_of(:brief) }
    it { expect(category).to validate_presence_of(:main_category) }
    it { expect(category).to validate_inclusion_of(:main_category).in_array(['air', 'water', 'land']) }
    #Format Validations
    it { expect(category).to allow_value('Trekking').for(:name) }
    it { expect(category).to allow_value('Praesent sapien massa.').for(:description) }
  end

  describe 'ActiveRecord databases' do
    it { expect(category).to have_db_column(:name).of_type(:string) }
    it { expect(category).to have_db_column(:description).of_type(:text) }
    it { expect(category).to have_db_column(:brief).of_type(:text) }
    it { expect(category).to have_db_column(:cover).of_type(:string) }
    it { expect(category).to have_db_column(:main_category).of_type(:string) }
    it { expect(category).to have_db_index(:name).unique(:true) }
  end

  describe 'ActiveRecord associations' do
    it { expect(category).to have_many(:activities).dependent(:destroy) }
  end

  describe 'public class methods' do
    
    context 'responds to its methods' do
    end
 
  
    context 'executes methods correctly' do
    end

  end
end
