class Order < ApplicationRecord
    belongs_to :user
    belongs_to :customer
    has_many :order_items
    has_many :products, through: :order_items
    
    # def add_product(product_id, quantity)
    #     self.products ||= []
    #     self.products << { product_id: product_id, quantity: quantity }
    #   end
end
