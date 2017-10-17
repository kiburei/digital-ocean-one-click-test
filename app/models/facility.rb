class Facility < ApplicationRecord
	belongs_to :hotel
	has_many :photos
	scope :by_price, -> price { where(:price => price) }
	scope :by_capacity, -> capacity { where(:capacity => capacity) }
end
