class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
