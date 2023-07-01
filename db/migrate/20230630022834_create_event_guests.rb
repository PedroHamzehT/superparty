class CreateEventGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :event_guests do |t|
      t.string :email
      t.references :user, foreign_key: true
      t.string :confirmation_token
      t.references :event, null: false, foreign_key: true
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
