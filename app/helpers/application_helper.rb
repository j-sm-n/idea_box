module ApplicationHelper
  def logged_in_admin?
    current_user && current_user.admin?
  end

  def logged_in_default?
    current_user && current_user.default?
  end
end
