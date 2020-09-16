class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :attendee, foreign_key: true
      t.references :event_attended, foreign_key: true

      t.timestamps
    end
  end
end
