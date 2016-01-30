class SignupsController < ApplicationController
  respond_to :json
  def create
    @user = User.create!(create_params)
    render json: @user
  end

  private
  def create_params
    params.require('user').permit(:email, :password, :password_confirmation)
  end
end
