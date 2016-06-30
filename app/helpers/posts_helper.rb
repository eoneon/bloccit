module PostsHelper
  def user_is_authorized_for_post?(post)
    current_user && (
      current_user == post.user ||
      current_user.admin? ||
      current_user.moderator? && (
        action_name == 'edit' || action_name == 'update' || action_name == 'destroy')
    )
  end
end
