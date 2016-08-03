describe Gallery, type: :model do
  
  it 'has a valid factory' do
    expect(build(:gallery)).to be_valid
  end

  let(:gallery) { build(:gallery) }

  describe 'ActiveRecord databases' do
    it { expect(gallery).to have_db_column(:image).of_type(:string) }
    it { expect(gallery).to have_db_column(:alt_text).of_type(:string) }
    it { expect(gallery).to have_db_column(:height).of_type(:string) }
    it { expect(gallery).to have_db_column(:width).of_type(:string) }
    it { expect(gallery).to have_db_column(:activity_id).of_type(:integer) }
  end

  describe 'ActiveRecord associations' do
    it { expect(gallery).to belong_to(:activity) }
  end
end
