class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token unless Rails.env.production?

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticated?
    current_user.present?
  end
end
