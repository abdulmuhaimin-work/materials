class Topic < ApplicationRecord
  has_many :posts
  mount_uploader :image, ImageUploader
end
