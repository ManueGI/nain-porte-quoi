class Dwarf < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :rentals
  has_one_attached :photo

  validates :name, :description, :age, :address, presence: true
end
