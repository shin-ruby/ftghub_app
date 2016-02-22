module ApplicationHelper

	def full_title(page_title = '')
		base_title = 'Fighting Technology Group Hub App'
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def flash_class_name(name)
    case name
    when 'notice' then 'success'
    when 'alert'  then 'danger'
    else name
    end
	end

	def current_user?(user)
    user == current_user
  end

  def current_profile?
  	Profile.find_by(user_id: current_user).nil?
  end

  def current_profile
  	Profile.find_by(user_id: current_user).id
  end

  def comment_count(fightpost)
    if Comment.find_by(fightpost_id: fightpost).nil?
      "0"
    else
      Comment.where(fightpost_id: fightpost).count
    end
  end

  def liker_fightpost
    if !params[:id].nil?
      params[:id]
    else
      @fightpost
    end
  end


end
