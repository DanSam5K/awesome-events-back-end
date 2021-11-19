class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.text :image
      t.datetime :date_of_event
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
