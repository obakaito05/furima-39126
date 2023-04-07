class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :comments

         validates :nickname, presence: true
         validates :surname, presence: true
         validates :first_name, presence: true
         validates :surname_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birthday, presence: true
end
