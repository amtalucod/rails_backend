module Types
    class ProductQuantityInputType < BaseInputObject
      description "Input type for product ID and quantity"
  
      # Define the input fields for the type
      argument :id, ID, required: true
      argument :quantity, Int, required: true
    end
  end
  