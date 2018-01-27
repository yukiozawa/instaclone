class PostMailer < ApplicationMailer
  def post_mail(picture)
    @picture = picture
    @user_email = @picture.user.email
    mail to: @user_email, subject: "ブログ内容の確認メール"
  end
end
