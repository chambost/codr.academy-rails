class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :cohort
      t.integer :point
      t.string :github
      t.string :linked_in

      t.timestamps
    end
  end
end
