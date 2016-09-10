require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "logged in user can logout" do
    user = User.create(username: "jasmin", password: "password", email_address: "jasmin@hudacsek.com")

    visit login_path
    fill_in "Username", with: "jasmin"
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Welcome, jasmin!")

    click_link "Logout"

    refute page.has_content?("Welcome, jasmin!")
  end
end
