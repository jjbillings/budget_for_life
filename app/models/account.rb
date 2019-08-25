class Account < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :account_type
  has_many :positions

  enum account_type: [:brokerage, :checking, :savings]
end
