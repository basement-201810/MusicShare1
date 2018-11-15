class Product < ApplicationRecord
	attachment :image
	has_many :musics
	has_many :carts
	has_many :reviews
	belongs_to :pro_label
	belongs_to :pro_genre
	has_many :cart_items
	enum pro_status: {release: true, nonrelease: false}

  def self.search(search) #ここでのself.はUser.を意味する
  	if search
      where(['name LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。#User.は省略
  else
      all #全て表示。#User.は省略
  end
end
end
