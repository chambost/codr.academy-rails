class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.string :content
      t.boolean :edited

      t.timestamps
    end
  end
end
