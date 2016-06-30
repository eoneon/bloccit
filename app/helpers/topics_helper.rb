module TopicsHelper
  def user_is_authorized_for_topics?
     current_user && current_user.admin? || current_user && current_user.moderator? && (action_name == 'edit' || action_name == 'update')
   end
end
