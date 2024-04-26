class User < ApplicationRecord
  has_secure_password
  belongs_to :location, optional: true
  
  # validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validate :validate_location_presence
  # validate :validate_photo_url

   private

  # def validate_location_presence
  #   unless location&.valid?
  #     location_errors = location.errors.full_messages.map { |msg| "Location: #{msg}" }
  #     location_errors.each do |error|
  #       errors.add(:base, error)
  #     end
  #   end
  # end
  
  # def validate_photo_url
  #   if photo_url.present?
  #     if !photo_url.is_a?(Array)
  #       errors.add(:photo_url, "must be an array")
  #     elsif photo_url.empty?
  #       errors.add(:photo_url, "can't be empty")
  #     elsif photo_url.length > 5
  #       errors.add(:photo_url, "can't have more than 5 elements")
  #     end
  #   end
  # end
end

