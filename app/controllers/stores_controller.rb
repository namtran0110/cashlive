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
    @streamer_view = true
    @stream_name = params[:stream_name]
    @store.update(streaming_now: true)
    clean_stream_instance
    @store.stream_instance.update(title: @stream_name, product_ids: [])
  end

  def end_stream
    #Store.update(streaming_now: false)
    #clean_stream_instance
  end

  def clean_stream_instance
    @store.stream_instance.update(title: nil, product_ids: [])
  end

end
