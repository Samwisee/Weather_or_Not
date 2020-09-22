class Freetime < ApplicationRecord

  belongs_to :user

  #validates :period, uniqueness: true
  validates :period, uniqueness: {scope: :user}

  def hours
    (start_at.to_i..end_at.to_i).to_a
  end
end
