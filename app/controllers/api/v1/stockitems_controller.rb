# frozen_string_literal: true

module Api
  module V1
    class StockitemsController < ApplicationController
      before_action :find_product, only: %i[quantities_of_product]

      # GET /stockitems
      def index
        @stockitems = Stockitem.all

        render json: @stockitems
      end

      # GET /stockitems/1
      def show
        render json: @stockitem
      end

      # POST /stockitems
      def create
        @stockitem = Stockitem.new(stockitem_params)
        if @stockitem.save
          render json: { msg: 'Item inserido ao estoque!', status: :created }
        else
          render json: { msg: @stockitem.errors.full_messages.to_sentence }
        end
      end

      # PATCH/PUT /quantities_of_product/1
      def add_quantities_of_product
        return_of_stock = []
        if @stock_product.present?
          new_stock_itens = @stockitem.reload_quantities_by_products_add(stockitem_params.merge(product_id: @stock_product.id))
          new_stock_itens.each do |new_stock_item|
            get_stock = Stockitem.find(new_stock_item[:id])
            get_stock.update(quantities: new_stock_item[:quantities].to_i)
            return_of_stock.push(get_stock)
          end
          render json: return_of_stock
        else
          render json: { msg: 'Produto não existe em estoque' }
        end
      end

      def lower_quantities_of_product
        return_of_stock = []
        if @stock_product.present?
          new_stock_itens = @stockitem.reload_quantities_by_products_lower(stockitem_params.merge(product_id: @stock_product.id))
          new_stock_itens.each do |new_stock_item|
            get_stock = Stockitem.find(new_stock_item[:id])
            get_stock.update(quantities: new_stock_item[:quantities].to_i)
            return_of_stock.push(get_stock)
          end
          render json: return_of_stock
        else
          render json: { msg: 'Produto não existe em estoque' }
        end
      end

      # DELETE /stockitems/1
      def destroy
        @stockitem.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def find_product
        @stockitem = Stockitem.new
        @stock_product = Product.where(id: params[:product_id]).take
      end

      # Only allow a trusted parameter "white list" through.
      def stockitem_params
        params.require(:stockitem).permit(:product_id, :store_id, :quantities)
      end
    end
  end
end
