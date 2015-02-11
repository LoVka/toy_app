require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @micropost = Micropost.new(content: "З'явився шанс на повернення старого тарифу в київському метро (Expres.ua)", user_id: users(:one).id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "     "
    assert_not @micropost.valid?
  end

  test "content should be shorter than 140" do
    @micropost.content = "a"*141
    assert_not @micropost.valid?
  end

end
