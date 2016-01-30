class CommentsController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:create, :update]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    @comment = Comment.find params[:id]
    render json: @comment
  end
  def create
    attributes = {
      name: create_params[:attributes][:name],
      body: create_params[:attributes][:body],
      post_id: create_params[:relationships][:post][:data][:id],
      user: current_resource_owner
    }
    @comment = Comment.create attributes
    render json: @comment
  end

  def create_params
    params.require(:data).permit(attributes: [:body, :name], relationships: [post: [data:[:id]]])
  end

  def update_params
    params.require().permit()
  end
end
