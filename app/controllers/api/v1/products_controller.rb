module Api 
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]

      # GET /products
      def index
        @products = Product.all
      
        render json: @products
      end
    
      # GET /products/1
      def show
        if @product.present?
          render json: @product
        else
          render json: { msg: 'Produto não encontrado!' }
        end
      end

      # POST /products
      def create
        @product = Product.new(product_params)
        if @product.save
          render json: { msg: 'Produto registrado!', status: :created }
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: { msg: 'Produto atualizado!', status: :created }
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /products/1
      def destroy
        if @product.present?
          @product.destroy
          render json: { msg: 'Produto removido!' }
        else
          render json: { msg: 'Produto não existe!'}
        end
      end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.where(id: params[:id]).take
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :price)
      end
    end
  end 
end