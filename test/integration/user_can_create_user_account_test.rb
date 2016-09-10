require 'test_helper'

class UserCanCreateUserAccount < ActionDispatch::IntegrationTest
  test 'user can create account' do
    visit new_user_path
    fill_in "Username", with: "jasmin"
    fill_in "Email Address", with: "jasmin@hudacsek.com"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert page.has_content?("Welcome, jasmin!")
  end
end
