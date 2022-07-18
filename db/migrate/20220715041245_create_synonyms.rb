class CreateSynonyms < ActiveRecord::Migration[6.1]
  def change
    create_table :synonyms do |t|
      t.string :reference
      t.references :word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
