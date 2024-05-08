module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :mobile_number, String, null: false
  #   field :photo_url, String, null: true
  #  field :country, String, null: true  
  #  field :region, String, null: true
  #  field :city, String, null: true
   field :admin, Boolean, null: false
  #  field :user_errors, String, null: true

  #  def country
  #    object.location&.country
  #  end

  #  def region
  #    object.location&.region
  #  end

  #  def city
  #    object.location&.city
  #  end
  end
end
