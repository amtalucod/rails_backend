class Location < ApplicationRecord
    has_many :users
    
#     validates :country, presence: true
#   validates :region, presence: true
#   validates :city, presence: true
end
