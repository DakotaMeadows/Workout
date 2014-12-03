class Workout < ActiveRecord::Base
  has_many :schedules
  has_many :users, through: :schedules

  has_many :sets
  has_many :exercises, through: :sets
end
