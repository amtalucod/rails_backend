# frozen_string_literal: true

module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :email, String
    field :mobile, String
    field :province, String
    field :city, String
    field :barangay, String
    field :street, String
    field :room, String
    field :floor, String
    field :bldg, String
    field :landmark, String
    field :remarks, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :country, String
    field :region, String
    field :province_code, String
    field :city_code, String
    field :barangay_code, String
  end
end
