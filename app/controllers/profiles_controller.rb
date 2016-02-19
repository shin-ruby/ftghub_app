class ProfilesController < ApplicationController
	before_action :authenticate_user!, only: [:edit, :update, :destroy]
	before_action :correct_user,   only: [:edit]

	def index
		
	end

	def show
		@user = User.find(params[:id])
		@profile = Profile.find_by(id: @user)
	end

	def new
		@profile = current_user.build_profile
	end

	def create
		@profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile created!"
      redirect_to @profile
    else
      render 'new'
    end
	end

	def edit
		@profile = Profile.find(params[:id])
	end



	private

    def profile_params
      params.require(:profile).permit(:fullname, :birthday, :sex, :tel, :introduction, :avatar)
    end

    def correct_user
    	@profile = current_user.profile
    	redirect_to root_url if @profile.nil?
    end

end
