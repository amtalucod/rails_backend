module Mutations
    class DeleteOrder < BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :message, String, null: true
  
      def resolve(id:)
        order = Order.find_by(id: id)
        if order.destroy
          {
            success: true,
            message: 'Order deleted successfully'
          }
        else
          {
            success: false,
            message: 'Failed to delete order'
          }
        end
      end
    end
  end
  