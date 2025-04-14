class PagesController < ApplicationController
  allow_unauthenticated_access only: [ :home, :register ]
  def home
    redirect_to dashboard_path if authenticated?
  end

  def dashboard
    if current_user&.admin?
      render :dashboard
    end

    redirect_to new_session_path unless authenticated?
  end

  def register
  end
end
