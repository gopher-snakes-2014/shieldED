feature "Admin" do

  scenario 'an admin visits admin page' do
    # @incidents = ["a","b","c","d","e","f","g"] add these when merged with models
    # @incidents.first.date = "2013-19-22"
    visit "users/admins/dashboard"
    expect(page).to have_content('Report Detail')
    expect(page).to have_content("Recent Reports")
  end
end
