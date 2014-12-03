class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :exercise
      t.references :workout

      t.timestamps
    end
  end
end
