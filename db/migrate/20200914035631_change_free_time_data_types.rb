class ChangeFreeTimeDataTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :freetimes, :start_at, :string
    change_column :freetimes, :end_at, :string
  end
end
