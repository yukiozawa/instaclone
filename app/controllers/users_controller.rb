class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    
  end

  def update
    current_user.update(update_params)
    if current_user.save
      redirect_to user_path(current_user.id), notice: 'ユーザー情報を更新しました。'
    else
      redirect_to user_path(current_user.id), alert: 'ユーザー情報の更新に失敗しました。'
    end
  end


  private
  def update_params
    params.require(:user).permit(:user_name, :introduction, :image )
  end

end
