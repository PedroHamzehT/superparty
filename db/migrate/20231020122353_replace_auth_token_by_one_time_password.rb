class ReplaceAuthTokenByOneTimePassword < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :auth_token, :string

    change_table :users do |t|
      t.integer :one_time_password
      t.datetime :one_time_password_confirmed_at
      t.datetime :one_time_password_created_at
    end
  end
end
