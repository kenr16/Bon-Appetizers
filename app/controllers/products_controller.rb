class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def homepage
    render :home
    # This render will link to the specific html.erb document in the folder that matches the controller.
  end

  def index
    @products = Product.all
    @user = current_user
  end

  def show
    @product = Product.find(params[:id])
    @user = current_user
    @tag = Tag.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      render :new
    end
  end

  def edit
   @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully edited!"
      redirect_to products_path
    else
      flash[:alert] = "Product edit failed!"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :image)
  end

end
