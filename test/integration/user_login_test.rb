require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "jasmin", password: "password", email_address: "jasmin@hudacsek.com")

    visit login_path
    fill_in "Username", with: "jasmin"
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Welcome, jasmin!")
  end

  test "user enters invalid login credentials" do
    user = User.create(username: "jasmin", password: "password", email_address: "jasmin@hudacsek.com")

    visit login_path
    fill_in "Username", with: "jasmin"
    fill_in "Password", with: "12345"
    click_on "Login"
    save_and_open_page

    assert page.has_content?("Username and/or Password is incorrect")
  end
end
