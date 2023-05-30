class Dwarf < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :name, :description, :age, :address, presence: true
end
