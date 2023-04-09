class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # has_many :comments

         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         validates :nickname, presence: true
         validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/ }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/ }
         validates :surname_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true
end
