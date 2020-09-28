class CreateForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.float :lat
      t.float :lon
      t.string :name

      t.timestamps
    end

    create_table :forecasts do |t|
      t.float :temp
      t.float :feels_like
      t.integer :dt
      t.float :wind_speed
      t.float :rain
      t.string :description
      t.string :main
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
