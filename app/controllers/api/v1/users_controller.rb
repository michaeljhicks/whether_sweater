class Api::V1::UsersController < ApplicationController 
  def create 
    user_params[:email] = user_params[:email].downcase
    user = User.new(user_params)

    if user.password != user.password_confirmation
      render json: { status: 400, message: "Passwords Do Not Match" }
    elsif User.find_by(email: user[:email]).present?
      render json: { status: 400, message: "Email Already Exists" }
    else 
      user.save 
      render json:(UserSerializer.new(user)), status: :created
    end
  end

  private 
  def user_params 
    params.permit(:email, :password, :password_confirmation)
  end
end