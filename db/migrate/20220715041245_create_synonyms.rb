class CreateSynonyms < ActiveRecord::Migration[6.1]
  def change
    create_table :synonyms do |t|

      t.timestamps
    end
  end
end
