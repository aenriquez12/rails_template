class IpLookupsController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create] if Rails.env.test?

  def new; end

  def create
    @ip = params[:ip]
    @result = VirusTotalLookup.lookup(@ip)
    render :show
  end
end
