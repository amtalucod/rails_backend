module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :product_id, Integer
    field :order_status, String
    field :order_option, String
    field :shipping, String
    field :payment, String
    field :subtotal, String
    field :shipping_fee, String
    field :convenience, String
    field :grand_total, String
    field :customer_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: true
    field :customer, CustomerType, null: true
    
    field :qty, [String], null: true
    field :products, [ProductType], null: true

    def qty
      object.order_items.map(&:qty) 
    end
    
    def products
      object.order_items.map(&:product)
    end
    
  end
end
