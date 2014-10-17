feature 'user management' do
  scenario "logs a user in based on key code" do
  Admin1 = User.create(username: "Admin", password_hash: "1234", level: "admin")
    visit root_path
      fill_in "username", with: "Admin"
      fill_in "password_hash", with: "1234"
      click_button "login"
    expect(page).to have_content('Admin')
  end

   scenario "logs a user in based on key code" do
    Parent1 = User.create(username: "Parent", password_hash: "1234", level: "parent")
    visit root_path
      fill_in "username", with: "Parent"
      fill_in "password_hash", with: "1234"
      click_button "login"
    expect(page).to have_content('Parent')
  end

   scenario "logs a user in based on key code" do
    Student1 = User.create(username: "Student", password_hash: "1234", level: "student")
    visit root_path
      fill_in "username", with: "Student"
      fill_in "password_hash", with: "1234"
      click_button "login"
    expect(page).to have_content('Student')
  end

end
