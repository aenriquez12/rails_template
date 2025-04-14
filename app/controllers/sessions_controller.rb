class SessionsController < ApplicationController
  skip_before_action :require_authentication, only: %i[ new create ]
  allow_unauthenticated_access only: %i[ new create ]
  def create
    user = User.find_by(email: params[:email_address])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid credentials"
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully."
  end
end
