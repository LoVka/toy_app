require 'test_helper'

class MicropostsIndexTest < ActionDispatch::IntegrationTest

  test "json includes correct content attribute" do
    get root_url, :format => "json"
    @micropost = Micropost.order(:id).last
    assert_equal json.size, Micropost.count
    assert_equal json[0]['text'], @micropost.content
  end
  
  test "json includes correct user attribute" do
    get root_url, :format => "json"
    assert_equal json.size, Micropost.count
    mp = json[0]
    @micropost = Micropost.order(:id).last
    assert_equal mp['user'], @micropost.user.name
  end
end
