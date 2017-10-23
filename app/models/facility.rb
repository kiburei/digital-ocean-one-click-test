class Facility < ApplicationRecord
	belongs_to :hotel
	has_many :photos
	has_many :bookings
	
end
