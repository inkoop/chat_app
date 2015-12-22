class CreateUserChatRooms < ActiveRecord::Migration
  def change
    create_table :user_chat_rooms do |t|
      t.references :user, index: true, foreign_key: true
      t.references :chat_room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
