

feature "Admin" do
  scenario 'an admin visits admin page' do
    @incidents = ["a","b","c","d","e","f","g"]
    @incidents.fist.date = "2013-19-22"
    visit "/admin/index"

    expect(page).to have_content('Incidents')
    expect(page).to have_content("#{@incidents.first.date}")
  end
end
