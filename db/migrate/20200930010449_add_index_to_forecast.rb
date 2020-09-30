class AddIndexToForecast < ActiveRecord::Migration[6.0]
  def change
    add_index :forecasts, [:location_id, :dt]
  end
end
