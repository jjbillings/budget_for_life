# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  user_id      :integer
#  account_type :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions
  validates_presence_of :name, :account_type

  enum account_type: [:brokerage, :checking, :savings]

  def balance
    transactions.map(&:amount).sum
  end
end
