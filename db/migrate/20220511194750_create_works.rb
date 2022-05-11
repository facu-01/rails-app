class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :title
      t.text :desc
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
