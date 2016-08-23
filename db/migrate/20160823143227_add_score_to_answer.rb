class AddScoreToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :score, :integer, default: 0
  end
end
