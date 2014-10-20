feature 'user management' do
  scenario "Redirects to admin dashboard page based on admin credentials" do
  Admin1 = User.create(username: "Admin", password_hash: "1234", level: "admin")
    visit root_path
    within(".admin-login-form") do
      fill_in "username", with: "Admin"
      fill_in "password_hash", with: "1234"
      click_button "login"
    end
    expect(page).to have_content('Admin')
  end
end

feature 'Student Dashboard' do
  scenario "Gives a student the option to upload a photo" do
    Student1 = User.create(username: "", password_hash: "123ST", level: "student")
    visit root_path
    within(".student-parent-login-form") do
      fill_in "password_hash", with: "123ST"
      click_button "login"
    end
    expect(page).to have_content('Upload a Photo')
    expect(page).to_not have_content('Admin')
    expect(page).to have_content('Record Event')
  end
end

feature 'Parent Dashboard' do
  scenario "Gives a parent the option to upload a photo" do
    Parent1 = User.create(username: "", password_hash: "456PR", level: "parent")
    visit root_path
    within(".student-parent-login-form") do
      fill_in "password_hash", with: "456PR"
      click_button "login"
    end
    expect(page).to have_content('Upload a Photo')
    expect(page).to_not have_content('Admin')
    expect(page).to have_content('Record Event')
  end
end


