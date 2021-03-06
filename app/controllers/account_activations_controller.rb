class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user&.unactive? && user&.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t "global.acc_activated"
      redirect_to user
    else
      flash[:danger] = t "global.invalidate_activation_link"
      redirect_to root_url
    end
  end
end
