class Location < ApplicationRecord
  geocoded_by :name

  has_many :users
end
