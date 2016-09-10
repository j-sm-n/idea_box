require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user can be created as an admin" do
    user = User.create(username: "penelope",
                       password: "boom",
                       email_address: "penelope@penny.com",
                       role: 1)

    assert_equal(user.role, "admin")
    assert(user.admin?)
  end

  test "user can be created as a default user" do
    user = User.create(username: "chris",
                       password: "12345",
                       email_address: "chris@day.com")

    assert_equal(user.role, "default")
    assert(user.default?)
  end
end
