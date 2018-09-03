class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.string :message
      t.references :chat_room
      t.references :user
    end
  end
end
