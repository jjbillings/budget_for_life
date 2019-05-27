class User < ApplicationRecord
  has_many :savings_goals, dependent: :destroy
  validates_presence_of :email, :birthdate
end
