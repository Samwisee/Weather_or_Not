class AddUserToFreetime < ActiveRecord::Migration[6.0]
  def change
    add_reference :freetimes, :user, null: false, foreign_key: true
  end
end
