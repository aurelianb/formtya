class CreateFormItemOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :form_item_options do |t|
      t.references :form_item, null: false, foreign_key: true
      t.string :label
      t.string :value

      t.timestamps
    end
  end
end
