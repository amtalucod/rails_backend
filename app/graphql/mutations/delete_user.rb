module Mutations
    class DeleteUser < BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :message, String, null: true
  
      def resolve(id:)
        user = User.find_by(id: id)
        if user.destroy
          {
            success: true,
            message: 'User deleted successfully'
          }
        else
          {
            success: false,
            message: 'Failed to delete user'
          }
        end
      end
    end
  end
  