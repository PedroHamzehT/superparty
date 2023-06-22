class AddTokenConfirmedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth_token_confirmed_at, :datetime
  end
end
