# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    user = User.first
    # This is how you pass value to params[:user] inside mailer definition!
    UserMailer.with(user: user).welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/forecast
  def forecast
    UserMailer.forecast
  end

end
