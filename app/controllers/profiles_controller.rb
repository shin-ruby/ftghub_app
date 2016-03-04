class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = 'Profile created!'
      redirect_to @profile.user
    else
      render 'edit'
    end
  end

  def show
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      flash[:success] = 'Profile updated!'
      redirect_to @profile.user
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:fullname, :birthday, :sex, :tel, :introduction, :avatar)
  end
end
