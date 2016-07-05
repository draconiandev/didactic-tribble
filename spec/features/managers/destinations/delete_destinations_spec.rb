feature 'Admins can delete a destination' do
  before do
    login_as(FactoryGirl.create(:person, :admin))
    create(:destination, name: 'Mysuru')
  end

  scenario do
    visit destinations_path
    click_link 'Mysuru'
    click_link 'Delete Destination'

    expect(page).to have_content 'Destination has been deleted'
    expect(page.current_url).to eq destinations_url
    expect(page).to have_no_content 'Mysuru'
  end
end
