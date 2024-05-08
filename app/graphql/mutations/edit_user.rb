module Mutations
    class EditUser < BaseMutation
      class AuthProviderEditData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end
      
      # class LocationInput < Types::BaseInputObject
      #   argument :country, String, required: false
      #   argument :region, String, required: false
      #   argument :city, String, required: false
      # end
      
      argument :id, ID, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :mobile_number, String, required: false
      argument :auth_provider, AuthProviderEditData, required: false
      # argument :location, LocationInput, required: false
  
      type Types::UserType
  
      def resolve(id:, first_name: nil, last_name: nil, mobile_number: nil, auth_provider: nil)
        user = User.find(id)
  
        if user.update(
          first_name: first_name || user.first_name,
          last_name: last_name || user.last_name,
          mobile_number: mobile_number || user.mobile_number,
          email: auth_provider&.[](:credentials)&.[](:email) || user.email,
          password: auth_provider&.[](:credentials)&.[](:password) || user.password
        )
          # update_location(user, location) if location.present?
          user
        else
          # Handle errors accordingly
          raise GraphQL::ExecutionError, user.errors.full_messages.join(", ")
        end
      rescue ActiveRecord::RecordNotFound => e
        # Handle the case where user with given ID is not found
        raise GraphQL::ExecutionError, "User not found"
        private

    
      end
      # def update_location(user, location)
      #   user_location = user.location || user.build_location
      #   user_location.update(
      #     country: location[:country],
      #     region: location[:region],
      #     city: location[:city]
      #   )
      # end
      
    end
  end
  