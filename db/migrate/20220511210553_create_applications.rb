class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.belongs_to :candidate, foreign_key: true
      t.belongs_to :work, foreign_key: true

      t.timestamps
    end
  end
end
