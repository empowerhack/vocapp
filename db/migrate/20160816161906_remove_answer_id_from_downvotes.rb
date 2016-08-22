class RemoveAnswerIdFromDownvotes < ActiveRecord::Migration
  def change
    remove_column :downvotes, :answer_id
  end
end
