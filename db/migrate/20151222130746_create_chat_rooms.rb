class CreateChatRooms < ActiveRecord::Migration
  def change
    create_table :chat_rooms do |t|
      t.string :name
      t.boolean :is_public
      t.timestamps null: false
    end
  end
end
