module Api
  module V1
    class StoresController < ApplicationController
      before_action :set_store, only: %i[show update destroy]
    
      # GET /stores
      def index
        @stores = Store.all
      
        render json: @stores
      end
    
      # GET /stores/1
      def show
        if @store.present?
          render json: @store
        else
          render json: { msg: 'Loja não encontrada!' }
        end
      end
    
      # POST /stores
      def create
        @store = Store.new(store_params)
      
        if @store.save
          render json: { msg: 'Loja registrada!', status: :created }
        else
          render json: @store.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /stores/1
      def update
        if @store.update(store_params)
        render json: { msg: 'Loja atualizada!', status: :created }
        else
          render json: @store.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /stores/1
      def destroy
        if @store.present?
          @store.destroy
          render json: { msg: 'Loja removida!' }
        else
          render json: { msg: 'Loja não existe!' }
        end
      end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_store
        @store = Store.where(id: params[:id]).take
      end

      # Only allow a trusted parameter "white list" through.
      def store_params
        params.require(:store).permit(:name, :street, :neighborhood, :city, :cep)
      end
    end
  end
end
