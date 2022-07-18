class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :reference
      t.integer :status, index: true, null: false, default: 0

      t.timestamps
    end
  end
end
