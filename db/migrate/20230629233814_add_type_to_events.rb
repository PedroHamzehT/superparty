class AddTypeToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_format, :integer, null: false
    add_column :events, :event_link, :string
  end
end
