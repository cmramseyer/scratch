class Item < ApplicationRecord

  validates :item_name, presence: true, length: { maximum: 50 }
  validates :item_description, presence: true, length: { maximum: 100 }
  validates :item_cost, presence: true, numericality: { greater_than: 0 }
end
