class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts, include:['comments']
  end

  def show
    @post = Post.find params[:id]
    render json: @post, include:['comments']
  end
end
