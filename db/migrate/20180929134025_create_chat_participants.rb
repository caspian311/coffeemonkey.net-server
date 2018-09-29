class CreateChatParticipants < ActiveRecord::Migration
  def change
    create_table :chat_participants do |t|
      t.references :chat_room
      t.references :user
      t.timestamps null: false
    end
  end
end
