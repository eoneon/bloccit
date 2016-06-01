class PostsController < ApplicationController
  def index
    @posts = Post.all.each_with_index{|post, index|  post.title = "spam" if index == 0 || index % 5 == 0}
    #@posts = Post.all.map!{|post|  post.title = "spam" if post.id == 1 || (post.id * 5) % 5 == 0}
  end

  def show
  end

  def new
  end

  def edit
  end
end
