class ReplaceAuthTokenByOneTimePassword < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.remove :auth_token, :auth_token_confirmed_at
      t.string :one_time_password
      t.datetime :one_time_password_confirmed_at
      t.datetime :one_time_password_created_at
    end
  end
end
