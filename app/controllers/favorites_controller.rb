class FavoritesController < ApplicationController
  def index
    @favorite_pictures = current_user.favorite_pictures.order(created_at: :desc).page(params[:page]).per(20)
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to root_path, notice: "Pictureをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:picture_id]).destroy
    redirect_to root_path, notice: "Pictureをお気に入り解除しました"
  end
end
