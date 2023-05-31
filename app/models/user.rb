class User < ApplicationRecord
  has_many :dwarves, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :rented_dwarves, through: :rentals, source: "dwarf"
  has_one_attached :avatar, dependent: :destroy

  # validates :user_name, :first_name, :last_name, :address, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
