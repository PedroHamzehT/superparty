class CreateContributionSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :contribution_suggestions do |t|
      t.string :name, null: false
      t.text :description
      t.references :contribution, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
