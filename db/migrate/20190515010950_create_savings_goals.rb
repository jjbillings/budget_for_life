class CreateSavingsGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :savings_goals do |t|
      t.string :name
      t.date :target_date
      t.boolean :strict_target_date, :default => false
      t.decimal :target_amount, :precision => 11, :scale => 2
      t.decimal :current_amount, :precision => 11, :scale => 2

      t.timestamps
    end
  end
end
