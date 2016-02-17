class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about

  end

end
