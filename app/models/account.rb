class Account < ApplicationRecord
  belongs_to :user
  has_many :positions
  validates_presence_of :name, :account_type

  enum account_type: [:brokerage, :checking, :savings]

  def balance
    positions.map(&:value).reduce(0, :+)
  end
end
