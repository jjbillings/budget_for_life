class Position < ApplicationRecord
  belongs_to :account
  belongs_to :savings_goal
end
