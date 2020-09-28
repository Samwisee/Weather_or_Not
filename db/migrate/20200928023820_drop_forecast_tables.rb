class DropForecastTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :forecasts
    drop_table :forecast_tables
  end
end
