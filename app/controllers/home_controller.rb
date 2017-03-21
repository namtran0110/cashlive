class HomeController < ApplicationController
  def index
    if current_user
      redirect_to dashboard_path
    else
      @stores = Store.all
    end
  end
end
