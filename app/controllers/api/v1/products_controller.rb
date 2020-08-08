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
          render json: { msg: 'Produto não encontrado!', status: status }
        end
      end

      # POST /products
      def create
        @product = Product.new(product_params)
        if @product.save
          render json: { msg: 'Produto registrado!', status: status, product: @product }
        else
          render json: @product.errors.full_messages.to_sentence, status: status
        end
      end
    
      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: { msg: 'Produto atualizado!', status: status }
        else
          render json: @product.errors, status: status
        end
      end
    
      # DELETE /products/1
      def destroy
        if @product.present?
          if Product.find_product_stock(@product.id).present?
            render json: { msg: 'Produto com estoque!', status: status }
          else
            @product.delete
            render json: { msg: 'Produto removido!', status: status }
          end
        else
          render json: { msg: 'Produto não existe!', status: status }
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
