module Mutations
    class CreateCategory < BaseMutation
      argument :name, String, required: true
  
      type Types::CategoryType
      #field :errors, [String], null: false
  
      def resolve(name: nil)
        category = Category.create(
            name: name,
        )
        if category.valid?
            category
        else
            raise GraphQL::ExecutionError, category.errors.full_messages.join(", ")
        end
        
      end
    end
  end
  