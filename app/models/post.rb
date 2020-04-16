class Post < ApplicationRecord
  belongs_to :user
  validates :title,:content,:image, presence: true
  mount_uploader :image, ImageUploader
end
