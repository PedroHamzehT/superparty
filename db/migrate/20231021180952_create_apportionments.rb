class CreateApportionments < ActiveRecord::Migration[7.0]
  def change
    create_table :apportionments do |t|
      t.date :start_date
      t.date :end_date
      t.integer :goal
      t.boolean :show_goal_progress
      t.boolean :dynamic_goal
      t.boolean :show_who_contributed
      t.integer :value_per_participant
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
