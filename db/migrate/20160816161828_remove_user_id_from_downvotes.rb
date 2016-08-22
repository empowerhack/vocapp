class RemoveUserIdFromDownvotes < ActiveRecord::Migration
  def change
    remove_column :downvotes, :user_id
  end
end
