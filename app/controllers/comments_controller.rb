class CommentsController < ApplicationController
  def create
    @fightpost = Fightpost.find(params[:fightpost_id])
    @comment = @fightpost.comments.create(comment_params)
    redirect_to fightpost_path(@fightpost)
  end

  def destroy
    @fightpost = Fightpost.find(params[:fightpost_id])
    @comment = @fightpost.comments.find(params[:id])
    @comment.destroy
    redirect_to fightpost_path(@fightpost)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
