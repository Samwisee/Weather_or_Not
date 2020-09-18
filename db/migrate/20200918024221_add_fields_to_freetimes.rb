class AddFieldsToFreetimes < ActiveRecord::Migration[6.0]
  def change
    add_column :freetimes, :active, :boolean
    add_column :freetimes, :period, :string
  end
end
