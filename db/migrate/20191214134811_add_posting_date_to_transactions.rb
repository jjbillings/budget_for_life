class AddPostingDateToTransactions < ActiveRecord::Migration[6.0]
  def up
    add_column :transactions, :posting_date, :date
    Transaction.all.each do |transaction|
      transaction.update_attributes(posting_date: transaction.created_at.to_date)
    end
  end

  def down
    remove_column :transactions, :posting_date
  end
end
