class StoresController < ApplicationController
  def show
    @store = Store.friendly.find(params[:id])
    if @store == nil
      render file: "#{Rails.root}/public/404.html", layout: false
    end
    @messages = @store.messages
    @products = @store.products

    if params[:streaming_now]
      start_stream
    end
  end

  def start_stream
    @store.update(streaming_now: true)
    @streamer_view = true
    @stream_name = params[:stream_name]
  end

  def end_stream
    Store.update(streaming_now: false)
  end

end
