class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # （_idは含めません）画像アップ用のメソッド（attachment）refileを使用するうえでのルール
  has_many :post_comments, dependent: :destroy #dependent: :destroyは、has_manyで使えるオプション
end
