class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :dwarf
  has_many :reviews
end
