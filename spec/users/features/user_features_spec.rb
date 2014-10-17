feature 'user management' do
  scenario "logs a user in based on key code" do
    visit root_path
      fill_in "Name", with: "Admin"
      fill_in "Password", with: "123"
      click_button "login"
    expect(page).to have_content('Admin')
  end

   scenario "logs a user in based on key code" do
    visit root_path
      fill_in "Name", with: "Parent"
      fill_in "Password", with: "123"
      click_button "login"
    expect(page).to have_content('Parent')
  end

   scenario "logs a user in based on key code" do
    visit root_path
      fill_in "Name", with: "Student"
      fill_in "Password", with: "123"
      click_button "login"
    expect(page).to have_content('Student')
  end

end
