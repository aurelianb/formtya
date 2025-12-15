class CreateFoorms < ActiveRecord::Migration[8.1]
  def change
    create_table :foorms do |t|
      t.string :title
      t.string :uuid

      t.timestamps
    end
  end
end
