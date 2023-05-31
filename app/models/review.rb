class Review < ApplicationRecord
  belongs_to :rental
  has_one :user, through: :rental
  has_one :dwarf, through: :rental

  validates :content, :score, presence: true
  validates :rental_id, uniqueness: { message: "You already submitted a review for this rental" }
end
