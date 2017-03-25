class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    if @user == nil
      render file: "#{Rails.root}/public/404.html", layout: false
    end
  end

end
