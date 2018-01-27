class PicturesController < ApplicationController
  def index
    @pictures = Picture.order(created_at: :desc).page(params[:page]).per(20)
  end

  def new
    user_filled?
    @picture = Picture.new
  end

  def create
    # binding.pry
    @picture = Picture.new(picture_params)
  
    if @picture.save
      PostMailer.post_mail(@picture).deliver
      redirect_to root_path, notice: '投稿完了しました。'
    else
      redirect_to new_picture_path, alert: '投稿に失敗しました。'
    end
  end

  def show
    @picture = Picture.find(params[:id])
    # binding.pry
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    # binding.pry
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
        redirect_to picture_path(@picture.id), notice: "ブログを編集しました！"
    else
        render 'edit'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to root_path, notice:"Pictureを削除しました！"
  end


  private
  def picture_params
    params.require(:picture).permit(:title, :content, :image).merge(user_id: current_user.id)
  end
end
