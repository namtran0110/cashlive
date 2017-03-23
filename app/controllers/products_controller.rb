class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "You just created #{@product.name}"
      session[:product_id] = @product.id
      redirect_to store_path(@store)
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :avatar)
  end
end
