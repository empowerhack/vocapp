class AddDownvotesCountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :downvotes_count, :integer, :default => 0
  end
end
