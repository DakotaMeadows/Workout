class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
