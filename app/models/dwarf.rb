class Dwarf < ApplicationRecord
  belongs_to :user
  has_many :rentals

  validates :name, :description, :age, :address, presence: true
end
