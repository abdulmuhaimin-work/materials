class Post < ApplicationRecord
has_many :comments
belongs_to :topic
mount_uploader :image, ImageUploader
validates :title, length: { minimum: 3 }, presence: true
validates :body, length: { minimum: 30 }, presence: true
end
