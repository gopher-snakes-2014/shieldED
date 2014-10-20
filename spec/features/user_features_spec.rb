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

   scenario "Redirects to parent dashboard page based on parent credentials" do
    Parent1 = User.create(username: "Parent", password_hash: "1234", level: "parent")
    visit root_path
    within(".admin-login-form") do
      fill_in "username", with: "Parent"
      fill_in "password_hash", with: "1234"
      click_button "login"
    end
    expect(page).to have_content('Parent')
    expect(page).to_not have_content('Admin')
    expect(page).to have_content('Record Event')
  end

   scenario "Redirects to student dashboard page based on student credentials" do
    Student1 = User.create(username: "Student", password_hash: "1234", level: "student")
    visit root_path
    within(".admin-login-form") do
      fill_in "username", with: "Student"
      fill_in "password_hash", with: "1234"
      click_button "login"
    end
    expect(page).to have_content('Student')
    expect(page).to_not have_content('Admin')
    expect(page).to have_content('Record Event')

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
    Student1 = User.create(username: "", password_hash: "456PR", level: "parent")
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


