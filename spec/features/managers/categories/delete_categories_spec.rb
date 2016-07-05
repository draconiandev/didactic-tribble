feature 'Admins can delete a category' do 
  before do
    login_as(create(:person, :admin))
    create(:category, name: 'Trekking')
  end

  scenario 'successfully' do
    visit categories_path
    click_link 'Trekking'
    click_link 'Delete Category'

    expect(page).to have_content 'Category has been deleted'
    expect(page.current_url).to eq categories_url
    expect(page).to have_no_content 'Trekking'
  end
end
