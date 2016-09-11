require "test_helper"

class AdminLogsInToAdminDashboardTest < ActionDispatch::IntegrationTest
  test "admin logs in and sees admin dashboard" do
    admin = User.create(username: "penelope",
                        password: "boom",
                        email_address: "pp@gmail.com",
                        role: 1)

    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: "boom"
    click_on "Login"

    assert page.has_content?('All Images')
    assert page.has_content?("All Categories")
    assert page.has_content?("Add New Image")
    assert page.has_content?("Add New Category")
  end

  test "default user logs in and doesn't see admin dashboard" do
    user = User.create(username: "bob",
                        password: "password",
                        email_address: "bob@gmail.com",
                        role: 0)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("All Ideas")
    assert page.has_content?("Add New Idea")
  end
end
