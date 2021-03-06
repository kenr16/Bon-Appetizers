class ReviewsController < ApplicationController
  before_action :authorize, only: [:new, :create]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @product = @review.product
  end

  def update
    @review = Review.find(params[:id])
    @product = @review.product
    if @review.update(review_params)
      flash[:notice] = "Review successfully edited!"
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted!"
    redirect_to product_path(@review.product)
  end

private
  def review_params
    params.require(:review).permit(:author, :rating, :content)
  end

end
