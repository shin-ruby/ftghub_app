class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
	before_action :admin_user,     only: :destroy

	def index
		@users = User.paginate(page: params[:page])
	end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

   # 确保是管理员
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
