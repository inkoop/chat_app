class AddTokenToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :token, :string
    add_index :invites, :token
  end
end
