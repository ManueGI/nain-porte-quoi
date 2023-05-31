class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :dwarf

  enum :status, { pending: 0, accepted: 1, refused: 2 }
end
