module Mutations
    class DeleteProduct < BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :message, String, null: true
  
      def resolve(id:)
        product = Product.find_by(id: id)
        if product.destroy
          {
            success: true,
            message: 'Product deleted successfully'
          }
        else
          {
            success: false,
            message: 'Failed to delete product'
          }
        end
      end
    end
  end
  