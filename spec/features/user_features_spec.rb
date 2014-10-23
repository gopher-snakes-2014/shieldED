feature 'user management' do
  xscenario "Redirects to admin dashboard page based on admin credentials" do
    admin_password = BCrypt::Password.create("1234")
  Admin1 = User.create(username: "Admin", password_digest: admin_password, level: "admin")
    visit root_path
    within(".student-parent-login-form") do
      fill_in "username", with: "Admin"
      fill_in "password_digest", with: "1234"
      click_button "login"
    end
    expect(page).to have_content('Admin')
  end
end

#HTTP_BASIC Protection prevents this test from working

feature 'Student Dashboard' do
  xscenario "Gives a student the option to upload a photo" do
    student_password = BCrypt::Password.create("123ST")
    Student1 = User.create(username: "", password_digest: student_password, level: "student")
    visit root_path
    click_link "Login"
    within(".student-parent-login-form") do
      fill_in "password_digest", with: "123ST"
      click_button "login"
      click_link "Report an Incident"
    end
    expect(page).to have_content('Upload a Photo')
    expect(page).to_not have_content('Admin')
    expect(page).to have_content('Event Summary')
  end
end

feature 'Parent Dashboard' do
  xscenario "Gives a parent the option to upload a photo" do
    parent_password = BCrypt::Password.create("456PR")
    Parent1 = User.create(username: "", password_digest: parent_password, level: "parent")
    visit root_path
    click_link "Login"
    within(".student-parent-login-form") do
      fill_in "password_digest", with: "456PR"
      click_button "login"
      click_link "Report an Incident"
    end
    expect(page).to have_content('Upload a Photo')
    expect(page).to_not have_content('Admin')
    expect(page).to have_content('Event Summary')
  end
end


