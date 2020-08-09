class Store < ApplicationRecord
  has_many :stockitems

  validates :name, presence: true
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :cep, presence: true

  scope :find_store_stock, lambda { |store_id|
                               joins(:stockitems)
                                 .where('stockitems.store_id = ?', store_id)
                               }
end
