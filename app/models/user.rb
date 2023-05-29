class User < ApplicationRecord
  has_many :dwarfs
  has_many :rentals

  validates :user_name, :first_name, :last_name, :address, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
