class DashboardController < ApplicationController
  def show
    unless current_user
      flash[:error] = "You must login to view Dashboard"
      redirect_to user_session_path
    else
      @user = current_user
      @stores = Store.where.not(user_id: @user.id)
    end
  end
end
