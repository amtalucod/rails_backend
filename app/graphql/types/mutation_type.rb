# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :login_user, mutation: Mutations::LoginUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :edit_user, mutation: Mutations::EditUser
    
    field :create_product, mutation: Mutations::CreateProduct
    field :delete_product, mutation: Mutations::DeleteProduct
    
    field :create_category, mutation: Mutations::CreateCategory
    
    field :create_customer, mutation: Mutations::CreateCustomer
    
    field :create_order, mutation: Mutations::CreateOrder
    field :update_order, mutation: Mutations::UpdateOrder
    field :delete_order, mutation: Mutations::DeleteOrder
    
  end
end
