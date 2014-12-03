class Exercise < ActiveRecord::Base
  has_many :sessions
  has_many :workouts, through: :sessions

  has_many :reps
  has_many :users, through: :reps
end
