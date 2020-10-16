class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :birth_day
    validates :password, length: { minimum: 6 },
                         format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :first_name, presence: true, format: { with: NAME_REGEX }
  validates :family_name, presence: true, format: { with: NAME_REGEX }

  NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  validates :first_name_kana, presence: true, format: { with: NAME_KANA_REGEX }
  validates :family_name_kana, presence: true, format: { with: NAME_KANA_REGEX }

  has_many :items
  has_many :item_purchases
end