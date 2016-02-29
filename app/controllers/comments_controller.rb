class CommentsController < ApplicationController
  before_action :set_fightpost

  def create
    @fightpost.comments.create(comment_params)
    redirect_to fightpost_path(@fightpost)
  end

  def destroy
    @fightpost.comments.find(params[:id]).destroy
    redirect_to fightpost_path(@fightpost)
  end

  private

  def set_fightpost
    @fightpost = Fightpost.find(params[:fightpost_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
