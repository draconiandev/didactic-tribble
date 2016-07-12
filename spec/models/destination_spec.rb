#
RSpec.describe Destination, type: :model do
  it 'has a valid factory' do
    expect(build(:destination)).to be_valid
  end

  let(:destination) { build(:destination) }

  describe 'ActiveModel validations' do
    #Presence Validations
    it { expect(destination).to validate_presence_of(:name) }
    it { expect(destination).to validate_presence_of(:description) }
    it { expect(destination).to validate_presence_of(:brief) }
    #Format Validations
    it { expect(destination).to allow_value('Kunthi Betta').for(:name) }
    it { expect(destination).to allow_value('Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.').for(:description) }
  end

  describe 'ActiveRecord associations' do
    it { expect(destination).to have_db_column(:name).of_type(:string) }
    it { expect(destination).to have_db_column(:description).of_type(:text) }
    it { expect(destination).to have_db_column(:brief).of_type(:text) }
    it { expect(destination).to have_db_column(:cover).of_type(:string) }
    it { expect(destination).to have_db_index(:name).unique(:true) }
  end

  describe 'public class methods' do
    
    context 'responds to its methods' do
    end
 
  
    context 'executes methods correctly' do
    end
  end
end
