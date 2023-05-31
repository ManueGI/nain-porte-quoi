class Dwarf < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_one_attached :photo, dependent: :destroy

  validates :name, :description, :age, :address, :price, presence: true
end
