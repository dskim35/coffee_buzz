class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :shop

  validates :shop, :presence => true
  validates :rating, :presence => true
  validates :review, :presence => true

end
