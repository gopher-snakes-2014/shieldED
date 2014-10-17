

feature "Admin" do
  scenario 'an admin visits admin page' do
    @incidents = ["a","b","c","d","e","f","g"]
    @incidents.first.date = "2013-19-22"
    visit "/admins/dashboard"

    expect(page).to have_content('Report Detail')
    expect(page).to have_content("#{@events.first.date}")
  end
end
