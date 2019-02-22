class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, :rating, :description, :user, presence: true
end
