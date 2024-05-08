module Mutations
    class CreateOrder < BaseMutation
    
    argument :user_id, ID, required: true
    argument :products, [Types::ProductQuantityInputType], required: true # Change the argument type to an array of ProductQuantityInputType
    argument :customer_id, ID, required: true
    argument :order_status, String, required: false
    argument :order_option, String, required: false
    argument :shipping, String, required: false
    argument :payment, String, required: false
    argument :subtotal, String, required: false
    argument :shipping_fee, String, required: false
    argument :convenience, String, required: false
    argument :grand_total, String, required: false
    
      type Types::OrderType
      #field :errors, [String], null: false
  
      def resolve(order_status: nil, customer_id: nil, user_id: nil, products: nil,
         order_option: nil, shipping: nil, payment: nil, subtotal: nil, shipping_fee: nil,
         convenience: nil, grand_total: nil)
        #binding.pry
        order = Order.create(
            user_id: user_id,
            # product_id: product_id,
            customer_id: customer_id,
            order_status: order_status,
            order_option: order_option,
            shipping: shipping,
            payment: payment,
            subtotal: subtotal,
            shipping_fee: shipping_fee,
            convenience: convenience,
            grand_total: grand_total
        )
        
        # Iterate through each product and create an OrderItem
        products.each do |product_input|
          product = Product.find_by(id: product_input[:id])
          # Set the quantity in each product
          #product.quantity = product_input.arguments[:quantity]
          # quantity = product_input.quantity

          #binding.pry
          if product
            order_item = OrderItem.new(
              order: order,
              product: product,
              qty: product_input.quantity
            )
            order.order_items << order_item
          else
            raise GraphQL::ExecutionError, "Product with ID #{product_input[:id]} not found"
          end
        end
        if order.save
          order
        else
          raise GraphQL::ExecutionError, order.errors.full_messages.join(", ")
        end
      end
    end
  end
  