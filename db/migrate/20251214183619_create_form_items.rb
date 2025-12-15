class CreateFormItems < ActiveRecord::Migration[8.1]
  def change
    create_table :form_items do |t|
      t.references :foorm, null: false, foreign_key: true
      t.text :label
      t.string :item_type

      t.timestamps
    end
  end
end
