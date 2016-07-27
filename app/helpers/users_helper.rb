module UsersHelper
  def user_has_posts_or_comments?
    @user.posts.count + @user.comments.count > 0
  end
end
