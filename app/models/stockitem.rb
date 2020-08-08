# frozen_string_literal: true

class Stockitem < ApplicationRecord
  belongs_to :product
  belongs_to :store
  validates_presence_of :quantities

  validate :not_min_quantities, on: :update

  def not_min_quantities
    quantities_of_id = Stockitem.find(id)
    current_stock = {
      id: id,
      product_id: product_id,
      current_quantities: quantities_of_id.quantities,
      msg: 'Estoque baixo!'
    }
    errors.add(:quantities, current_stock) if quantities_of_id.quantities <= 0 && quantities_of_id.quantities >= quantities
  end

  def quantities_by_products_add(params)
    new_stock = []
    current_stocks = Stockitem.find_product(params[:product_id]).select(:id, :quantities)
    current_stocks.each do |current_stock|
      new_iten = {
        id: current_stock.id,
        quantities: params[:quantities].to_i + current_stock.quantities
      }
      new_stock.push(new_iten)
    end
    new_stock
  end

  def quantities_by_products_lower(params)
    new_stock = []
    current_stocks = Stockitem.find_product(params[:product_id]).select(:id, :quantities)
    current_stocks.each do |current_stock|
      # next if current_stock.quantities == 0
      new_iten = {
        id: current_stock.id,
        quantities: current_stock.quantities - params[:quantities].to_i
      }
      new_stock.push(new_iten)
    end
    new_stock
  end

  scope :find_product, lambda { |product_id|
    where(product_id: product_id)
  }
end
