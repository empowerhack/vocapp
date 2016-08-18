class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|

      t.timestamps null: false
    end
  end
end
