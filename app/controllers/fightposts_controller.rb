class FightpostsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
	before_action :correct_user,   only: :destroy

  def show
    @fightpost = Fightpost.find(params[:id])
  end

  def new
    @fightpost = current_user.fightposts.build
  end

	def create
    @fightpost = current_user.fightposts.build(fightpost_params)
    if @fightpost.save
      flash[:success] = "Fightpost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'new'
    end
  end

  def destroy
  	@fightpost.destroy
  	flash[:success] = "Fightpost deleted"
  	redirect_to request.referrer || root_url
  end

  private

    def fightpost_params
      params.require(:fightpost).permit(:content, :picture)
    end

    def correct_user
    	@fightpost = current_user.fightposts.find_by(id: params[:id])
    	redirect_to root_url if @fightpost.nil?
    end

end
