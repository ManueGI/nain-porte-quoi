class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :dwarf
  has_many :reviews
  enum :status, { pending: 0, accepted: 1, refused: 2 }
end
