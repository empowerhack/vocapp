class AddUpvotesCountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :upvotes_count, :integer, :default => 0
  end
end
