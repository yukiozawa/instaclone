class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_filled?
    @user = User.find(current_user.id)

    unless @user.image.present? || @user.user_name.present? || @user.introduction.present?

      redirect_to edit_user_path(current_user.id), notice: "新規投稿のためにユーザー情報を登録してください。"
    end

  end
end
