class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
    	if params[:tag]
    		@feed_items = current_user.feed.tagged_with(params[:tag]).paginate(page: params[:page])
    	else
    		@feed_items = current_user.feed.paginate(page: params[:page])
    	end
    end
  end

  def about
  end

  def feedpro
    #暂时的页面
    render :layout => 'general'
  end

  def feedone
    render :layout => 'general'
  end

  def feedimg
    render :layout => 'general'
  end

end
