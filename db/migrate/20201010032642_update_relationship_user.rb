class UpdateRelationshipUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :locations, null: false, foreign_key: true
  end
end
