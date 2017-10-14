class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :hotel
  belongs_to :facility
end
