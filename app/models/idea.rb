class Idea < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  belongs_to :category
  has_many :images, through: :ideas_images
end
