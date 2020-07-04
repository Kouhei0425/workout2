class Article < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :user
  has_many :comments
end
