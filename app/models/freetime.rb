class Freetime < ApplicationRecord
  attr_accessor :freetime_checkbox
  
  belongs_to :user
end
