class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image # （_idは含めません）画像アップ用のメソッド（attachment）refileを使用するうえでのルール
  has_many :post_comments, dependent: :destroy
  #dependent: :destroyは、1:Nの関係において「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)   #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するか調べる
    favorites.where(user_id: user.id).exists?
  end
end
