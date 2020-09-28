class ChangeColumnNameInForecast < ActiveRecord::Migration[6.0]
  def change
    add_column :forecasts, :short_description, :string
    add_column :forecasts, :long_description, :string
  end
end
