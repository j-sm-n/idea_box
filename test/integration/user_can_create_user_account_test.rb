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

  test "user has blank password" do
    visit new_user_path
    fill_in "Username", with: "jasmin"
    fill_in "Email Address", with: "jasmin@hudacsek.com"
    click_on "Create Account"

    assert page.has_content?("Password can't be blank")
  end

  test "user has blank username" do
    visit new_user_path
    fill_in "Email Address", with: "jasmin@hudacsek.com"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert page.has_content?("Username can't be blank")
  end

  test "user has blank email" do
    visit new_user_path
    fill_in "Username", with: "jasmin"
    fill_in "Password", with: "password"
    click_on "Create Account"

    assert page.has_content?("Email address can't be blank")
  end
end
