class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end
