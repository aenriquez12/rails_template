class PagesController < ApplicationController
  allow_unauthenticated_access only: [ :home, :register ]
  def home
    redirect_to dashboard_path if authenticated?
  end

  def dashboard
    if authenticated?
      render :dashboard
    else
      redirect_to new_session_path, alert: "You must be signed in."
    end
  end

  def register
  end
end
