class RemoveColumnsFromAnswers < ActiveRecord::Migration
  def up
    change_table :answers do |t|
      t.remove :upvotes
      t.remove :downvotes
    end
  end
end
