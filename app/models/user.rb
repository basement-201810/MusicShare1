class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases
  has_many :reviews
  has_many :carts
  enum user_status: {release: true, nonrelease: false}
  validates :name, presence: :true
  validates :name_kana, presence: :true
  validates :email, presence: true
  validates :address, presence: :true
  validates :post_code, presence: :true, length: { maximum: 7 }
  validates :tell, presence: :true, uniqueness: true #電話番号は同じものは登録できません
end