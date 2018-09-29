class CreateChatParticipants < ActiveRecord::Migration
  def change
    create_table :chat_participants do |t|
      t.references :chat_room
      t.references :user
      t.timestamps null: false
    end

    add_index :chat_participants, [:chat_room_id, :user_id], :unique => true
    add_foreign_key :chat_participants, :users
    add_foreign_key :chat_participants, :chat_rooms
  end
end
