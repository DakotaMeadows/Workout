class Sets < ActiveRecord::Migration
  def change
    create_table :sets do |t|
      t.references :exercises
      t.references :workouts

      t.timestamps
    end
  end
end
