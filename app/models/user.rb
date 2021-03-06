class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :freetimes, dependent: :destroy
  has_one :location
  accepts_nested_attributes_for :location

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  # after_commit :async_update # Run on create & update

  # private

  # def async_update
  #   UpdateUserJob.perform_later(self)
  # end

  def available_hours
    freetimes.where(active: true).map(&:hours).flatten
  end

  # after user sign up, the below code will send email to the user
  # TODO after_create :send_welcome_email, :send_forecast_email

  private

  def async_update
    NotificationJob.perform_later(self)
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  # def send_forecast_email
  #   data =  Weather.call(latitude, longitude)
  #   @forecast = Forecast.new(data)
  #   UserMailer.with(user: self).forecast.deliver_later!(wait_until: 1.minutes.from_now)
  # end

end
