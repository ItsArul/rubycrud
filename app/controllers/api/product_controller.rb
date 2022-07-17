module Api
  class ProductController < ApplicationController
    def index
      @product =  Product.all
      render json: @product
    end
    
    def show
      @product = Product.find(params[:id])
      render json: @product
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        render json: @product
      else
        render json: @product.errors, status: unprocessable_entity
      end
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.error, status: unprocessable_entity
      end
    end

    def destroy
      @product = Product.find(params[:id])
      if @product.present?
        @product.destroy
        render json: @product
      else
        render json: error("not find product")
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :count, :price, :description)
    end
  end
end
