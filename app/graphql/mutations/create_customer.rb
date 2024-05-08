module Mutations
    class CreateCustomer < BaseMutation
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :mobile, String, required: true
      argument :country, String, required: true
      argument :city, String, required: true
      argument :barangay, String, required: true
      argument :floor, String, required: true
      argument :landmark, String, required: true
      argument :province, String, required: true
      argument :street, String, required: true
      argument :room, String, required: true
      argument :bldg, String, required: true
      argument :remarks, String, required: true
      argument :region, String, required: true
      argument :province_code, String, required: true
      argument :city_code, String, required: true
      argument :barangay_code, String, required: true
  
      type Types::CustomerType
      field :errors, [String], null: false
  
      def resolve(first_name: nil, last_name: nil, email: nil, mobile: nil, country: nil, city: nil, barangay: nil, floor: nil, landmark: nil, province: nil, street: nil, room: nil, bldg: nil, remarks: nil, region: nil, province_code: nil, city_code: nil, barangay_code: nil)
        existing_customer = Customer.find_by(email: email)
        
        if existing_customer.present?
          existing_customer.update(
            first_name: first_name,
            last_name: last_name,
            mobile: mobile,
            country: country,
            city: city,
            barangay: barangay,
            floor: floor,
            landmark: landmark,
            province: province,
            street: street,
            room: room,
            bldg: bldg,
            remarks: remarks,
            region: region,
            province_code: province_code,
            city_code: city_code,
            barangay_code: barangay_code
          )
          
          if existing_customer.valid?
            return existing_customer
          else
            raise GraphQL::ExecutionError, existing_customer.errors.full_messages.join(", ")
          end
        else
          customer = Customer.create(
            first_name: first_name,
            last_name: last_name,
            email: email,
            mobile: mobile,
            country: country,
            city: city,
            barangay: barangay,
            floor: floor,
            landmark: landmark,
            province: province,
            street: street,
            room: room,
            bldg: bldg,
            remarks: remarks,
            region: region,
            province_code: province_code,
            city_code: city_code,
            barangay_code: barangay_code
          )
  
          if customer.valid?
            return customer
          else
            raise GraphQL::ExecutionError, customer.errors.full_messages.join(", ")
          end
        end
      end
    end
  end
        