class CreateDwarves < ActiveRecord::Migration[7.0]
  def change
    create_table :dwarves do |t|
      t.string :name
      t.text :description
      t.integer :age
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
