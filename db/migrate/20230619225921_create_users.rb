class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :auth_token, unique: true

      t.timestamps
    end
  end
end
