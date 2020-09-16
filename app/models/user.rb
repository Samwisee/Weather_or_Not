class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :freetimes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :city_name
  after_validation :geocode, if: :will_save_change_to_city_name?

  after_commit :async_update # Run on create & update

  private

  def async_update
    UpdateUserJob.perform_later(self)
  end

end
