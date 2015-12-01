class CommentsController < ApplicationController
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
      post_id: create_params[:relationships][:post][:data][:id]
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
