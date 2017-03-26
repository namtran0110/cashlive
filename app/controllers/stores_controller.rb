class StoresController < ApplicationController
  #before_action set_streaming [only: :show] --> set boolean in database
  ## ^^use correct syntax

  def show

    @store = Store.friendly.find(params[:id])
    if @store == nil
      render file: "#{Rails.root}/public/404.html", layout: false
    end
    @messages = @store.messages
    @products = @store.products

    if params[:streaming_now]
      @streaming_now = true
      @stream_name = params[:stream_name]
      ## ^^ try moving these into set_streaming before action
    end
  end

  def set_streaming
    if params[:streaming_now]
      Store.update(streaming_now: true)
    end
  end

  # def stream
  #   @store = Store.friendly.find(params[:id])
  #   @products = @store.products
  #   @streaming = true;
  #   redirect_to store_path(current_user.store)
  # end

end
