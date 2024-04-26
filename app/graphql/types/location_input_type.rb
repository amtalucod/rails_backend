module Types
    class LocationInputType < Types::BaseInputObject
      description "Input type for location data"
      
      argument :country, String, required: false
      argument :region, String, required: false
      argument :city, String, required: false
    end
  end
  