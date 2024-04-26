module Mutations
    class EditUser < BaseMutation
      class AuthProviderEditData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end
      
      class LocationInput < Types::BaseInputObject
        argument :country, String, required: false
        argument :region, String, required: false
        argument :city, String, required: false
      end
      
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :auth_provider, AuthProviderEditData, required: false
      argument :location, LocationInput, required: false
  
      type Types::UserType
  
      def resolve(id:, name: nil, auth_provider: nil, location: nil)
        user = User.find(id)
  
        if user.update(
          name: name || user.name,
          email: auth_provider&.[](:credentials)&.[](:email) || user.email,
          password: auth_provider&.[](:credentials)&.[](:password) || user.password
        )
          update_location(user, location) if location.present?
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
      def update_location(user, location)
        user_location = user.location || user.build_location
        user_location.update(
          country: location[:country],
          region: location[:region],
          city: location[:city]
        )
      end
      
    end
  end
  