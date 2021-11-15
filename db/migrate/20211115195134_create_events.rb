class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.string :image_url, null: false
      t.datetime :date_of_event, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.integer :attendees_count, null: false

      t.timestamps
    end
  end
end
