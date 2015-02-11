require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name should be valid" do
    @user = User.new(name: 'But', email: "but@exam.ua", password: "12345678", password_confirmation: "12345678")
    assert @user.valid?
  end

  test "name should be present" do
    @user = User.new(name: '      ', email: "but@exam.ua", password: "12345678", password_confirmation: "12345678")
    assert_not @user.valid?
  end

  test "name should be shorter than 50" do
    @user = User.new(name: '      ', email: "but@exam.ua", password: "12345678", password_confirmation: "12345678")
    @user.name = "a"*51
    assert_not @user.valid?
  end

end
