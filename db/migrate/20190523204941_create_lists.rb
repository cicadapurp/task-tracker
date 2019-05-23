class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :note
      t.belongs_to :task, foreign_key: true

      t.timestamps
    end
  end
end
