class ChangeAgeToBirthdate < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :age, :integer
    add_column :users, :birthdate, :datetime
  end
end
