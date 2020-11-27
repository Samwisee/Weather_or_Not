class Location < ApplicationRecord
  geocoded_by :name

  belongs_to :users, :foreign_key => "locations_id"
  has_many :users, inverse_of: :location
end
