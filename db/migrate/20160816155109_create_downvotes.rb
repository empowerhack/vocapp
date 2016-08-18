class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.string :user_id
      t.string :answer_id

      t.timestamps null: false
    end
  end
end
