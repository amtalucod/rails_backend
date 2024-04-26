# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :login_user, mutation: Mutations::LoginUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :edit_user, mutation: Mutations::EditUser
  end
end
