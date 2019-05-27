class User < ApplicationRecord
  has_many :savings_goals, dependent: :destroy
end
