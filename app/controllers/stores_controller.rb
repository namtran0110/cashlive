class StoresController < ApplicationController
  def show
    @store = Store.find_by_slug(params[:id])
    @messages = @store.messages
  end
end
