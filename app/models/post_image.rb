class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # （_idは含めません）画像アップ用のメソッド（attachment）refileを使用するうえでのルール
end
