feature 'Managers' do
  before do
    login_as(create(:person, :admin))
    visit categories_path
    click_link 'New Category'
  end

  scenario 'can create new categories with valid attributes' do
    fill_in       'Name', with: 'Trekking'
    fill_in       'Description', with: 'An awesome adventure', match: :first
    select        'Land', from: 'category_main_category'
    fill_in       'category[brief]', with: 'An awesome description'
    fill_in       'category[slug]', with: 'An awesome description'
    page.attach_file('category_cover', 'spec/fixtures/files/card.jpg')
    click_button  'Submit'

    expect(page).to have_content 'Category has been created'

    category = Category.find_by(name: 'Trekking')
    expect(page.current_url).to eq category_url(category)
  end

  scenario 'cannot create new categories without valid attributes' do
    click_button 'Submit'
    expect(page).to have_content 'Sorry! Category could not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end
