class AddUserIdToUpvotes < ActiveRecord::Migration
  def change
    add_reference :upvotes, :user, index: true, foreign_key: true
  end
end
