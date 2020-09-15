class AddParametersToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :city_name, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
