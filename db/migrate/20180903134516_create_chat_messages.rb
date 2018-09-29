class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.string :message
      t.references :chat_room
      t.references :user
      t.timestamps null: false
    end

    add_foreign_key :chat_messages, :users
    add_foreign_key :chat_messages, :chat_rooms
  end
end
