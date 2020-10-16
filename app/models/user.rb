class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, format: { with: /\A[a-z0-9]+\z/i }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ン]+\z/ }
  validates :birth_day, presence: true

  has_many :items
  has_many :item_purchases
end
