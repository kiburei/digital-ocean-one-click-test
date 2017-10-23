class Hotel < ApplicationRecord
	mount_uploader :logo, ImageUploader
	has_many :facilities
	has_many :photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	geocoded_by :name
	after_validation :geocode, :if => :name_changed?			 
end
