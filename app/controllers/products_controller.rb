class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = "You just created #{@product.name}"
      session[:product_id] = @product.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Your product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
