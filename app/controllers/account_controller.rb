class AccountController < ApplicationController
  before_action :logged_in_user
  def index
    return unless current_user.trainee?

    redirect_to home_url
  end
end
