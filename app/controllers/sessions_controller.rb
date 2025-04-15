class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    user = User.find_by(email_address: params[:email_address])

  # Check if user is found and the password matches
  if user&.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to "/dashboard", notice: "Signed in successfully."
  else
    flash[:alert] = "Invalid email or password."
    render :new
  end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out successfully."
  end
  def home
    Rails.logger.debug("In the homepage action")
  end
  
end
