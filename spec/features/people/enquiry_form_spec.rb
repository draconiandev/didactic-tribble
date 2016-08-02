# feature "Enquiry Form Email", type: :feature do

#   scenario "People can send email via enqiury form" do
#     activity = create(:activity)
#     visit activities_path
#     click_link activity.title

#     click_button 'Enquire'

#     fill_in 'Name', with: 'Jony Ive'
#     fill_in 'Email', with: 'abhi.trek@gmail.com'
#     fill_in 'Phone', with: '1234567890'
#     fill_in 'Message', with: 'Message'

#     click_button 'Submit'

#     save_and_open_page
#     expect(page).to have_text('Thank you for your enquiry. We will get back soon to help you in your plans!')

#     last_email.to.should include('pavanprakash21@gmail.com') 
#     last_email.from.should include('abhi.trek@gmail.com')
#   end 
# end