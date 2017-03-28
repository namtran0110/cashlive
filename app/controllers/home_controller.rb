class HomeController < ApplicationController
  def index
    if current_user
      redirect_to dashboard_path
    else
      @stores = Store.all
      @streaming_stores = Store.where(streaming_now: true)
    end
  end
end
