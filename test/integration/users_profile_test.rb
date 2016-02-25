require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test 'profile display' do
    get user_path(@user)
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.fightposts.count.to_s, response.body
    assert_select 'ul.pagination'
    @user.fightposts.paginate(page: 1).each do |fightpost|
      assert_match fightpost.content, response.body
    end
  end
end
