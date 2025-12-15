class CreateAnswers < ActiveRecord::Migration[8.1]
  def change
    create_table :answers do |t|
      t.references :submission, null: false, foreign_key: true
      t.references :form_item, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
