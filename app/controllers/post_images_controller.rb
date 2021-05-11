class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new #空のインスタンス変数を渡し、投稿ができるようにします。
  end

  def create
    @post_image = PostImage.new(post_image_params) #何か投稿する時は必ずparamsを通る！ Railsのルール
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new  #空のインスタンス変数を渡し、コメント投稿ができるようにします。
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
