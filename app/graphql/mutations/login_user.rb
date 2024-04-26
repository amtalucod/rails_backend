module Mutations
  class LoginUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    field :user, Types::UserType, null: true
    field :errors, [String], null: false
    field :notice, String, null: true

    def resolve(credentials:)
      user = User.find_by(email: credentials[:email].downcase)
      if user && user.authenticate(credentials[:password])
        context[:session][:user_id] = user.id
        # if user.admin?
        #   {
        #     user: user,
        #     errors: [],
        #     notice: 'Welcome Admin, You have been logged in successfully !'
        #   }
        #else
          {
            user: user,
            errors: [],
            notice: 'Welcome, You have been logged in successfully !'
          }
        #end
      else
        {
          user: nil,
          errors: ['Invalid email/password combination'],
          notice: nil
        }
      end
    end
    
  end
end
  