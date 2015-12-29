class AddTokenToChatRoom < ActiveRecord::Migration
  def change
    add_column :chat_rooms, :token, :string
    add_index :chat_rooms, :token
  end
end
