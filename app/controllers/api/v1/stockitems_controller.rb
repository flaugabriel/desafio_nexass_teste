# frozen_string_literal: true

module Api
  module V1
    class StockitemsController < ApplicationController
      before_action :find_product, only: %i[add lower]

      def create
        @stockitem = Stockitem.new(stockitem_params)
        if @stockitem.save
          render json: { msg: 'Item inserido ao estoque!', status: status }
        else
          render json: { msg: @stockitem.errors.full_messages.to_sentence }
        end
      end

      def add
        return_of_stock = []
        new_stock_itens = @stockitem.quantities_by_products_add(stockitem_params.merge(product_id: @stock_product.id))
        new_stock_itens.each do |new_stock_item|
          get_stock = Stockitem.find(new_stock_item[:id])
          get_stock.update(quantities: new_stock_item[:quantities].to_i)
          return_of_stock.push(get_stock)
        end
        render json: return_of_stock, status: status
      end

      def lower
        return_of_stock = []
        new_stock_itens = @stockitem.quantities_by_products_lower(stockitem_params.merge(product_id: @stock_product.id))
        new_stock_itens.each do |new_stock_item|
          get_stock = Stockitem.find(new_stock_item[:id])
          get_stock.update(quantities: new_stock_item[:quantities].to_i)
          if get_stock.errors.messages.present?
            get_stock.errors.messages[:quantities].each do |errors|
              return_of_stock.push(errors)
            end
            next
          end
          return_of_stock.push(get_stock)
        end
        render json: return_of_stock, status: status
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def find_product
        @stock_product = Product.where(id: params[:product_id]).take
        if @stock_product.present?
          @stockitem = Stockitem.new
        else
          render json: { msg: 'Produto não existe em estoque' }
        end
      end

      # Only allow a trusted parameter "white list" through.
      def stockitem_params
        params.require(:stockitem).permit(:product_id, :store_id, :quantities)
      end
    end
  end
end
