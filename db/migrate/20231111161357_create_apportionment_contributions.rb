class CreateApportionmentContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :apportionment_contributions do |t|
      t.references :apportionment, null: false, foreign_key: true
      t.references :event_guest, null: false, foreign_key: true
      t.integer :amount_in_cents, null: false

      t.timestamps
    end
  end
end
