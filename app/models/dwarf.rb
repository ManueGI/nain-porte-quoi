class Dwarf < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :rentals
  has_many :reviews, through: :rentals

  has_one_attached :photo, dependent: :destroy

  validates :name, :description, :age, :address, :price, presence: true
end
