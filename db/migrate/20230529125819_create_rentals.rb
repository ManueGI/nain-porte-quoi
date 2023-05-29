class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.string :status
      t.date :rental_begin
      t.date :rental_end
      t.references :user, null: false, foreign_key: true
      t.references :dwarf, null: false, foreign_key: true

      t.timestamps
    end
  end
end
