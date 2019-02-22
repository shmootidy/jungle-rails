class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, :rating, :user, presence: true
end
