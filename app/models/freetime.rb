class Freetime < ApplicationRecord

  belongs_to :user

  validates :period, uniqueness: true
end
