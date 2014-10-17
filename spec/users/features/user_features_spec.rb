feature 'user management' do
  scenario "Redirects to admin dashboard page based on admin credentials" do
  Admin1 = User.create(username: "Admin", password_hash: "1234", level: "admin")
    visit root_path
      fill_in "username", with: "Admin"
      fill_in "password_hash", with: "1234"
      click_button "login"
    expect(page).to have_content('Admin')
  end

   scenario "Redirects to parent dashboard page based on parent credentials" do
    Parent1 = User.create(username: "Parent", password_hash: "1234", level: "parent")
    visit root_path
      fill_in "username", with: "Parent"
      fill_in "password_hash", with: "1234"
      click_button "login"
    expect(page).to have_content('Parent')
    expect(page).to_not have_content('Admin')
  end

   scenario "Redirects to student dashboard page based on student credentials" do
    Student1 = User.create(username: "Student", password_hash: "1234", level: "student")
    visit root_path
      fill_in "username", with: "Student"
      fill_in "password_hash", with: "1234"
      click_button "login"
    expect(page).to have_content('Student')
    expect(page).to_not have_content('Admin')
  end

end
