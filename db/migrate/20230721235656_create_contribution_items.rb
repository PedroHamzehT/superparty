class CreateContributionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :contribution_items do |t|
      t.references :contribution, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :max_amount_allowed, null: false, default: 1

      t.timestamps
    end
  end
end
