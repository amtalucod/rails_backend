# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_users, [UserType], null: false
    field :user, UserType, null: true do
      argument :id, ID, required: true
    end
    # field :current_user, Types::UserType, null: true
    

    def all_users
      User.all
    end
    
    def user(id:)
      User.find_by(id: id)
    end
    
    # def current_user
    #   context[:current_user]
    # end
  end
end
