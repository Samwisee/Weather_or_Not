class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject

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
    data =  Weather.call(@user.latitude, @user.longitude)
    @forecast = Forecast.new(data)
    @tomorrow_best_time = @forecast.best_tomorrow_hourly(@user)
    mail(to: @user.email, subject: 'Weather or Not: Best time for tomorrow to go outside')
    # mail to: "to@example.org"
  end
end
