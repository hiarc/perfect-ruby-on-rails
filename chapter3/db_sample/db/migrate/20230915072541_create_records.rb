class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :column1
      t.integer :column2

      t.timestamps
    end
  end
end
