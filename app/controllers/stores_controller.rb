class StoresController < ApplicationController
  def show
    @store = Store.find_by_slug(params[:id])
    if @store == nil
      render file: "#{Rails.root}/public/404.html", layout: false
    end
    @messages = @store.messages
  end
end
