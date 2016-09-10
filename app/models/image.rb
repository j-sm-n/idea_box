class Image < ActiveRecord::Base
  has_many :ideas, through: :ideas_images

end
