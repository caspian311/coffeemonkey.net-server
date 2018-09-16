class CreateLoginSessions < ActiveRecord::Migration
  def change
    create_table :login_sessions do |t|
      t.references :user
      t.string :auth_token
      t.references :user
      t.datetime :expires_at
      t.timestamps null: false
    end
  end
end
