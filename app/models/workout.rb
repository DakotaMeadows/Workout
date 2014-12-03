class Workout < ActiveRecord::Base
  has_many :schedules
  has_many :users, through: :schedules

  has_many :sessions
  has_many :exercises, through: :sessions
end
