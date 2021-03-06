class Idea < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :images
end
