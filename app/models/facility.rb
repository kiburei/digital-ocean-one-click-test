class Facility < ApplicationRecord
	belongs_to :hotel
	has_many :photos
	has_many :bookings
	scope :by_price, -> price { where(:price => price) }
	scope :by_capacity, -> capacity { where(:capacity => capacity) }
end
