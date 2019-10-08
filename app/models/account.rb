class Account < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :account_type

  enum account_type: [:brokerage, :checking, :savings]
end