# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :stockitems
  
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}

  scope :find_product_stock, lambda { |product_id|
                               joins(:stockitems)
                                 .where('stockitems.product_id = ?', product_id)
                             }
end
