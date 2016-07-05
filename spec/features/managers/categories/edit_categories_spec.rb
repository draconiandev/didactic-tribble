feature 'Admin' do
  let(:admin){ create(:person, :admin) }

  before do
    category = create(:category)
    login_as(admin)
    visit categories_path
    click_link category.name
    click_link 'Edit Category'
  end

  scenario 'can update a category with valid attributes' do    
    fill_in 'Name', with: 'Trek'
    click_button 'Submit'

    expect(page).to have_content 'Category has been updated'
    expect(page).to have_content 'Trek'
  end

  scenario 'cannot update a category with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Submit'

    expect(page).to have_content 'Category has not been updated'
  end  
end
