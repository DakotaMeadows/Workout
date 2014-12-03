class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :users
      t.references :workouts

      t.timestamps
    end
  end
end
