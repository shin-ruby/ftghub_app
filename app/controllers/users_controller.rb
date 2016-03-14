class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :ensure_is_admin, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @fightposts = @user.fightposts.paginate(page: params[:page])
    @profile = @user.profile
    render :layout => 'general'
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def ensure_is_admin
    redirect_to(root_url) unless current_user.admin?
  end
end
