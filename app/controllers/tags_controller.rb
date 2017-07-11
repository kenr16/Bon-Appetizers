class TagsController < ApplicationController

  def create

    @product = Product.find(params[:product_id])
    @tag = @product.tags.new(tag_params)

    if @tag.save
      Association.create(product_id: @product.id, tag_id: @tag.id)
      flash[:notice] = "Tag successfully saved."
      redirect_to product_path(@product)
    else
      flash[:alert] = "There was a problem creating the tag. Please try again."
      redirect_to product_path(@product)
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

  end
