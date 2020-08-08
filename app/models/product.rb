# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :stockitems
  
  validates :name, presence: true
  validates :price, presence: true

  scope :find_product_stock, lambda { |product_id|
                               joins(:stockitems)
                                 .where('stockitems.product_id = ?', product_id)
                             }
end
