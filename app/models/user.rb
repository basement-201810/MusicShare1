class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases
  has_many :reviews
  has_many :carts
  enum user_status: {release: true, nonrelease: false}

  # validates :name, presence: :true, length: {minimum: 2 ,maximum: 20 }
  # validates :name_kana, presence: :true
  # validates :email, presence: :true,uniqueness: true
  # validates :address, presence: :true
  # validates :post_code, presence: :true, numericality: { only_integer: true },length: { maximum: 10 }
  # validates :tell, presence: :true, numericality: { only_integer: true },uniqueness: true #電話番号は同じものは登録できません
  # paginates_per 5
  acts_as_paranoid
end
