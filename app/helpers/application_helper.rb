module ApplicationHelper
  def logged_in_admin?
    current_user && current_user.admin?
  end

  def find_all_idea_images(idea_id)
    IdeasImage.where(idea_id: idea_id)
  end

  def user_home(user)
    link_to "Back to Dashboard", user_path(user.id)
  end
end
