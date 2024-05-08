# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :photo, String
    field :type, String
    field :category, String
    field :price, String
    field :quantity, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer
    field :user, UserType, null: true
  end
end
