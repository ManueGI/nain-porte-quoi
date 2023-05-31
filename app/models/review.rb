class Review < ApplicationRecord
  belongs_to :rental
  has_one :user, through: :rental
  has_one :dwarf, through: :rental

  validates :content, :score, presence: true
end
