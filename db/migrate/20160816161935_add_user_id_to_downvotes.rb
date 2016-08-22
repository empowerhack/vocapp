class AddUserIdToDownvotes < ActiveRecord::Migration
  def change
    add_reference :downvotes, :user, index: true, foreign_key: true
  end
end
