class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.references :users
      t.references :exercises

      t.timestamps
    end
  end
end
