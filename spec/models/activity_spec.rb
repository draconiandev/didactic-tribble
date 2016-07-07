#
RSpec.describe Activity, type: :model do
  it 'has a valid factory' do
    expect(build(:activity)).to be_valid
  end

  let(:activity) { build(:activity) }

  describe 'ActiveModel validations' do
    #Presence Validations
    it { expect(activity).to validate_presence_of(:title) }
    it { expect(activity).to validate_presence_of(:overview) }
    it { expect(activity).to validate_presence_of(:itinerary) }
    it { expect(activity).to validate_presence_of(:start_date) }
    it { expect(activity).to validate_presence_of(:price) }
    it { expect(activity).to validate_presence_of(:difficulty) }
    it { expect(activity).to validate_presence_of(:brief) }
    it { expect(activity).to validate_presence_of(:slug) }
    it { expect(activity).to validate_numericality_of(:price) }
    it { expect(activity).to validate_uniqueness_of(:title).case_insensitive }
    #Format Validations
    it { expect(activity).to allow_value('Kunthi Betta').for(:title) }
    it { expect(activity).to validate_inclusion_of(:handcrafted_category).in_array(['weekend_getaway', 'team_outing', 'elderly_activity', 'women_special']) }
    it { expect(activity).to validate_inclusion_of(:difficulty).in_array(['easy', 'moderate', 'challenging']) }
    it { expect(activity).to_not allow_value('test').for(:price) }
    it { expect(activity).to_not allow_value(-1).for(:price) }
    it { expect(activity).to allow_value(0).for(:price) }
  end

  describe 'ActiveRecord databases' do
    it { expect(activity).to have_db_column(:title).of_type(:string) }
    it { expect(activity).to have_db_column(:overview).of_type(:text) }
    it { expect(activity).to have_db_column(:itinerary).of_type(:text) }
    it { expect(activity).to have_db_column(:start_date).of_type(:date) }
    it { expect(activity).to have_db_column(:end_date).of_type(:date) }
    it { expect(activity).to have_db_column(:price).of_type(:decimal) }
    it { expect(activity).to have_db_column(:cover).of_type(:string) }
    it { expect(activity).to have_db_column(:brief).of_type(:text) }
    it { expect(activity).to have_db_column(:slug).of_type(:string) }
    it { expect(activity).to have_db_index(:title).unique(:true) }
  end

  describe 'ActiveRecord associations' do
    it { expect(activity).to belong_to(:destination) }
    it { expect(activity).to belong_to(:category) }
  end

  describe 'public class methods' do
    context 'responds to its methods' do
      it { expect(activity).to respond_to(:end_date_after_start_date) }
    end
  end
  
    context 'executes methods correctly' do
      context 'end_date_after_start_date' do
        it 'makes sure the end date is after the start date' do
          expect(build(:activity, end_date: '2016/03/06', start_date: '2016/03/09' )).to_not be_valid
        end
      end
    end
end
