class AddIsFreshToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :is_fresh, :boolean
  end
end
