class User < ActiveRecord::Base
  has_secure_password

  has_many :schedules
  has_many :workouts, through: :schedules

  has_many :reps
  has_many :exercises, through: :reps
end
