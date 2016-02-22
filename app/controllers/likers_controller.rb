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
		@fightpost = Liker.find(params[:id]).fightpost_id
		current_user.likers.find_by(fightpost_id: @fightpost).destroy
		@fightpost = Fightpost.find(@fightpost)

		respond_to do |format|
			format.html { redirect_to @fightpost }	
			format.js
		end
	end

end
