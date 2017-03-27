class PostsController < ApplicationController
  respond_to :json
  before_action :doorkeeper_authorize!, only: [:create, :update]
  def index
    @posts = Post.all
    render json: @posts, include:['comments']
  end

  def show
    @post = Post.find params.permit(:id)[:id]
    render json: @post, include:['comments']
  end

  def create
    attributes = {
      title: create_params[:attributes][:title],
      body: create_params[:attributes][:body],
      user: current_resource_owner
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
