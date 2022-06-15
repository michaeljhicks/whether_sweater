class Api::V1::SessionsController < ApplicationController 
  def create 
    user_params[:email] = user_params[:email].downcase
    user = User.find_by(email: user_params[:email])

    if user.present?
      if user.authenticate(user_params[:password])
        session[:user_id] = user.id
        render json:(UserSerializer.new(user)), status: :created 
      else 
        render json: { error: "Email and/or Password is Invalid"}, status: 400
      end
    else 
      render json: { error: "Email and/or Password is Invalid"}, status: 400
    end
  end

  private
  def user_params
    params.permit(:email, :password)
  end
end