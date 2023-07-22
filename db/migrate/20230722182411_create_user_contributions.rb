class CreateUserContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contributions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :contribution_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
