require 'test_helper'

class CommentTest < ActiveSupport::TestCase

	def setup
		@user = users(:michael)
		@fightpost = fightposts(:orange)
		@comment = @user.comments.build(content: 'Good Job', fightpost: @fightpost)
	end

	test "should be valid" do
		assert @comment.valid?
	end

	test "user id should be present" do
		@comment.user = nil
		assert_not @comment.valid?
	end

	test "fightpost id should be present" do
		@comment.fightpost_id = nil
		assert_not @comment.valid?
	end

	test "content should be present" do
		@comment.content = " "
		assert_not @comment.valid?
	end

	test "content should be at most 140 characters" do
		@comment.content = "a" * 141
		assert_not @comment.valid?
	end

	test "order should be most recent first" do
		assert_equal Comment.recent.first,  comments(:most_recent_comment)
	end

end
