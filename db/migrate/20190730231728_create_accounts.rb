class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.belongs_to :user
      t.integer :account_type
      t.string :name

      t.timestamps
    end
  end
end
