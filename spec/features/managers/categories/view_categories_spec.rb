feature 'Admins can view all categories' do
  let(:admin) { create(:person, :admin) }

  before do
    login_as(admin)
  end

  scenario 'with the category description' do
    category = create(:category)
    visit categories_path
    click_link category.name
    expect(page.current_url).to eq category_url(category)
  end
end
