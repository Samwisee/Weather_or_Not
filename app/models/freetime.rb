class Freetime < ApplicationRecord

  belongs_to :user

  #validates :period, uniqueness: true
  validates :period, uniqueness: {scope: :user}

  def hours
    (start_time.to_i..end_time.to_i).to_a
  end
  
end
