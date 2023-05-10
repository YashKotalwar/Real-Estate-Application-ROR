class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable


  has_many :properties


  # has_many :favorites
  # has_many :favorite_properties, through: :favorites, source: :property


  has_many :favorites, dependent: :destroy
  has_many :favorite_properties, through: :favorites, source: :property



  def full_name
    "#{first_name} #{last_name}"
  end


  # def company
  #   "test company"
  # end

end
