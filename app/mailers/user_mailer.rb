class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: 'Weather or Not')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forecast.subject
  #
  def forecast
    @greeting = "Hi"
    @user = params[:user]
    @forecast = params[:forecast]
    mail(to: @user.email, subject: 'Weather or Not')
    # mail to: "to@example.org"
  end
end
