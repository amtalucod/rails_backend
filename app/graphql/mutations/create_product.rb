# app/graphql/mutations/create_product.rb

module Mutations
    class CreateProduct < BaseMutation
      argument :name, String, required: true
      argument :description, String, required: false
      argument :photo, String, required: false
      argument :type, String, required: false
      argument :category, String, required: false
      argument :price, String, required: true
      argument :user_id, ID, required: true
  
      type Types::ProductType
      #field :errors, [String], null: false
  
      def resolve(name: nil, description: nil, photo: nil, type: nil, category: nil, price: nil, user_id: nil)
        product = Product.create(
            name: name,
            description: description,
            photo: photo,
            type: type,
            category: category,
            price: price,
            user_id: user_id
        )
        if product.valid?
            product
        else
            raise GraphQL::ExecutionError, product.errors.full_messages.join(", ")
        end
      end
    end
  end
  