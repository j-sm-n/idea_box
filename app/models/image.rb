class Image < ActiveRecord::Base
  validates :image_url, presence: true

  has_many :ideas, through: :ideas_images

end
