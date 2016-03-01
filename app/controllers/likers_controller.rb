class LikersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fightpost

  def create
    current_user.likers.create(fightpost_id: @fightpost.id)
    respond_to do |format|
      format.html { redirect_to @fightpost }
      format.js
    end
  end

  def destroy
    Liker.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to @fightpost }
      format.js
    end
  end

  private

  def set_fightpost
    @fightpost = Fightpost.find(params[:fightpost_id])
  end
end
