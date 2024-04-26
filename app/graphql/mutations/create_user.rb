module Mutations
    class CreateUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :credentials, Types::AuthProviderCredentialsInput, required: false
      end
      
      class LocationInput < Types::BaseInputObject
        argument :country, String, required: false
        argument :region, String, required: false
        argument :city, String, required: false
      end
      
      argument :name, String, required: true
      argument :auth_provider, AuthProviderSignupData, required: false
      argument :location, LocationInput, required: false
      argument :photo_url, [String], required: false
      argument :admin, Boolean, required: false
  
      type Types::UserType
      field :user_errors, [String], null: false
  
      def resolve(name: nil, auth_provider: nil, location: nil, photo_url: nil, admin: nil)  
        user_params = {
          name: name,
          email: auth_provider&.[](:credentials)&.[](:email),
          password: auth_provider&.[](:credentials)&.[](:password),
          photo_url: photo_url,
          admin: admin || false
        }
        
        user = User.new(user_params)
  
        if location.present?
          user.build_location(
            country: location[:country],
            region: location[:region],
            city: location[:city]
          )
        end
        # binding.pry
        user.save!
        user
        
      rescue ActiveRecord::RecordInvalid => e
        error_message = ""
        e.record.errors.full_messages.each do |message|
          error_message += "#{message}\n"
        end
        GraphQL::ExecutionError.new(error_message)
      end
      
    end
  end