module ApplicationHelper
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
end
