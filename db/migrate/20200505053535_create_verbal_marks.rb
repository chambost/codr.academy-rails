class CreateVerbalMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :verbal_marks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.string :verbal_mark

      t.timestamps
    end
  end
end
