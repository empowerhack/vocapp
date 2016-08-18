class AddAnswerIdToDownvotes < ActiveRecord::Migration
  def change
    add_reference :downvotes, :answer, index: true, foreign_key: true
  end
end
