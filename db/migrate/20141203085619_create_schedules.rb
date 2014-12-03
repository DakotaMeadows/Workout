class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :user
      t.references :workout

      t.timestamps
    end
  end
end
