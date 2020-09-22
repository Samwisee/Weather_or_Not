#TODO
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_reader :available_hours
  has_many :freetimes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :city_name
  after_validation :geocode, if: :will_save_change_to_city_name?

  # after_commit :async_update # Run on create & update

  # private

  # def async_update
  #   UpdateUserJob.perform_later(self)
  # end
  def available_hours
    if freetime(:active)
      freetimes.map(&:hours).flatten
    end
  end

  after_create :send_welcome_email, :send_forecast_email

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  def send_forecast_email
    data =  Weather.call(latitude, longitude)
    @forecast = Forecast.new(data)
    UserMailer.with(forecast: @forecast, user: self).forecast.deliver_now
  end

end
