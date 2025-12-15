class CreateSubmissions < ActiveRecord::Migration[8.1]
  def change
    create_table :submissions do |t|
      t.references :foorm, null: false, foreign_key: true
      t.string :submitter

      t.timestamps
    end
  end
end
