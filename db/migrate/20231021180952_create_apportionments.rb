class CreateApportionments < ActiveRecord::Migration[7.0]
  def change
    create_table :apportionments do |t|
      t.date :start_date
      t.date :end_date
      t.integer :goal_in_cents
      t.boolean :show_goal_progress, null: false, default: false
      t.boolean :dynamic_goal, null: false, default: false
      t.boolean :show_who_contributed, null: false, default: false
      t.integer :value_per_participant_in_cents
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
