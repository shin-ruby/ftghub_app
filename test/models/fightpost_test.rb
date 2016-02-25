require 'test_helper'

class FightpostTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @fightpost = @user.fightposts.build(content: "aikido")
  end

  test "should be valid" do
    assert @fightpost.valid?
  end

  test "user id should be present" do
    @fightpost.user = nil
    assert_not @fightpost.valid?
  end

  test "content should be present" do
  	@fightpost.content = " "
  	assert_not @fightpost.valid?
  end

  test "content should be at most 260 characters" do
    @fightpost.content = "a" * 261
    assert_not @fightpost.valid?
  end

  test "order should be most recent first" do
  	assert_equal Fightpost.first, fightposts(:most_recent)
  end

end
