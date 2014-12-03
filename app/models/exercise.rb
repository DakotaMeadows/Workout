class Exercise < ActiveRecord::Base
  has_many :sets
  has_many :workouts, through: :sets

  has_many :reps
  has_many :users, through: :reps
end
