class LikersController < ApplicationController
  before_action :authenticate_user!

  def create
    @fightpost = Fightpost.find(params[:fightpost_id])
    current_user.likers.create(fightpost_id: @fightpost.id)

    respond_to do |format|
      format.html { redirect_to @fightpost }
      format.js
    end
  end

  def destroy
    fightpost_id = Liker.find(params[:id]).fightpost_id
    current_user.likers.find_by(fightpost_id: fightpost_id).destroy
    @fightpost = Fightpost.find(fightpost_id)

    respond_to do |format|
      format.html { redirect_to @fightpost }
      format.js
    end
  end
end
