class AddAnswerIdToUpvotes < ActiveRecord::Migration
  def change
    add_reference :upvotes, :answer, index: true, foreign_key: true
  end
end
