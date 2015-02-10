require 'test_helper'

class MicropostsIndexTest < ActionDispatch::IntegrationTest
 
  def setup
    @micropost = microposts(:one)
    @user = users(:one)
  end

  test "index including pagination with first 5 elements" do
    get root_path
    assert_template 'microposts/index'
    assert_select '.pagination'
    Micropost.order(:id).page(1).each do |mp|
      assert_select 'td', text: mp.content
    end
  end

  test "index including pagination doesn't have next 5 elements" do
    get root_path
    Micropost.order(:id).page(2).each do |mp|
      assert_select 'td', text: mp.content, count: 0
    end
  end
end
