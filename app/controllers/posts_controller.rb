class PostsController < ApplicationController
  include ActionController::ImplicitRender
  respond_to :json
  def index
    @posts = Post.all
    render json: @posts, include:['comments']
  end

  def show
    @post = Post.find params[:id]
    render json: @post, include:['comments']
  end

  def create
    attributes = {
      title: create_params[:attributes][:title],
      body: create_params[:attributes][:body]
    }
    @post = Post.create attributes
    respond_with @post
  end

  def create_params
    params.require(:data).permit(attributes: [:body, :title])
  end

  def update_params
    params.require().permit()
  end
end
