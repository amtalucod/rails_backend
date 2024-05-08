module Mutations
  class UpdateOrder < BaseMutation
    argument :id, ID, required: true

    type Types::OrderType

    def resolve(id: nil)
      order = Order.find(id)

      # Here you might want to check the current order_status
      if order.order_status == "pending"
        # If the order_status is "pending", update it to "confirmed"
        if order.update(order_status: "confirmed")
          order
        else
          # Handle errors accordingly
          raise GraphQL::ExecutionError, order.errors.full_messages.join(", ")
        end
      elsif order.order_status == "confirmed"
        # If the order_status is "confirmed", update it to "completed"
        if order.update(order_status: "completed")
          order
        else
          # Handle errors accordingly
          raise GraphQL::ExecutionError, order.errors.full_messages.join(", ")
        end
      else
        # If the order_status is neither "pending" nor "confirmed", do nothing
        order
      end
    rescue ActiveRecord::RecordNotFound => e
      # Handle the case where order with given ID is not found
      raise GraphQL::ExecutionError, "Order not found"
    end
  end
end
