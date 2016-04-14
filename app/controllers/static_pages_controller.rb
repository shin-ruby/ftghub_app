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

  def discover
  end

  def setting
  end

  def about
  end

  def feedpro
    # 暂时的页面
  end

  def feedone
  end

  def feedimg
  end
end
