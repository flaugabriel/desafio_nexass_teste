class StockitemsController < ApplicationController
  before_action :set_stockitem, only: [:show, :update, :destroy]

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
      render json: @stockitem, status: :created, location: @stockitem
    else
      render json: @stockitem.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stockitems/1
  def update
    if @stockitem.update(stockitem_params)
      render json: @stockitem
    else
      render json: @stockitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stockitems/1
  def destroy
    @stockitem.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stockitem
      @stockitem = Stockitem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stockitem_params
      params.require(:stockitem).permit(:product_id, :store_id, :quantities)
    end
end
