# feature "Admin visits dashboard" do

#   before :each do
#     admin_password = BCrypt::Password.create("1234")
#     @Admin1 = User.create(username: "Admin", password_digest: admin_password, level: "admin")
#     params = {username: "Admin", password_digest: admin_password}
#     allow_any_instance_of(AdminsController).to receive(:http_basic_authenticate_with).and_return(true)
#   end

#   scenario 'an admin visits admin page' do
#     visit admin_dashboard_path
#     expect(page).to have_content('Report Detail')
#     expect(page).to have_content("Recent Reports")
#   end
# end

#Routes are no longer accessible without loggin in - Andrew

feature "Admin searches for an incident " do

  xscenario 'an admin searches incidents by content of event' do
    Event.create(submitter: "Jimmy", details: "She said I'm fat.", date: "2011-12-09")
    visit root_path

    fill_in "search", :with => "fat"
    click_button("search")

    expect(page).to have_content("2011-12-09")
  end

  #Routes are no longer accessible without logging in - Andrew

  # scenario 'an admin searches for events with submitter option in search field' do
  #   Event.create(submitter: "Ellen", details: "He barfed on me.", date: "2014-07-19", location: "stairwell", offender: "do-do-bird")
  #   visit "admins/dashboard"
  #   expect(response).to eq(200)

  #   fill_in "Search", :with => "Ellen"
  #   click_button "Search Reports"
  #   expect(page).to have_content("He barfed")

  # end
end

