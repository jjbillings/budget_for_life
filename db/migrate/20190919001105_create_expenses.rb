class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :amount, :precision => 11, :scale => 2
      t.integer :status

      t.timestamps
    end
  end
end
