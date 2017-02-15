class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :definition
      t.string :translation
      t.integer :correct_answers

      t.timestamps
    end
  end
end
