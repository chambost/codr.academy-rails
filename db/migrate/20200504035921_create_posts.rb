class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.references :user
      t.boolean :edited
      t.datetime :time

      t.timestamps
    end
  end
end
