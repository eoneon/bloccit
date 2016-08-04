class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to @view
    else
      flash[:alert] = "Comment failed to save."
      redirect_to @view
    end
  end

  def destroy
    comment = @commentable.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      redirect_to @view
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to @view
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
