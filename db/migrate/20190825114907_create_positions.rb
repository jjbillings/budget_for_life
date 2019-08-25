class CreatePositions < ActiveRecord::Migration[6.0]
  def change
    create_table :positions do |t|
      t.integer :quantity
      t.decimal :price, :precision => 11, :scale => 2
      t.string :ticker
      t.belongs_to :account
      t.belongs_to :savings_goal

      t.timestamps
    end
  end
end
