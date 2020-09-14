class CreateFreetimes < ActiveRecord::Migration[6.0]
  def change
    create_table :freetimes do |t|
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
