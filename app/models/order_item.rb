class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product
    
    # def self.create_order_items(order_id, products)
    #     products.each do |product|
    #       OrderItem.create(
    #         order_id: order_id,
    #         product_id: product[:id],
    #       )
    #     end
    #   end
    
    
end
