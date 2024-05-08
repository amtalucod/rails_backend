# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_users, [UserType], null: false
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end
    
    field :all_products, [ProductType], null: false
    
    field :all_categories, [CategoryType], null: false
    
    field :all_customers, [CustomerType], null: false
    
    field :all_orders, [OrderType], null: false
    
    field :customer_by_email, CustomerType, null: true do
      argument :email, String, required: true
    end

    
    def all_users
      User.all
    end
    
    def user(id:)
      User.find_by(id: id)
    end
    
    def all_products
      Product.all
    end
    
    def all_categories
      Category.all
    end
    
    def all_customers
      Customer.all
    end
     
    def customer_by_email(email:)
      Customer.find_by(email: email)
    end
    
    def all_orders
      Order.all
    end
    
  end
end
