class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  mount_uploader :image, ImageUploader
  validates :body, length: { minimum: 4 }, presence: true
  has_many :votes

  def total_votes
    votes.pluck(:value).sum
  end
end
