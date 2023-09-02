class AddFieldsToContributionLists < ActiveRecord::Migration[7.0]
  def change
    change_table :contributions do |t|
      t.boolean :suggestions_allowed, :auto_create_suggestions, :show_who_contributed, default: false, null: false
    end
  end
end
