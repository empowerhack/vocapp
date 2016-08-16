class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :definition
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps null: false
    end
  end
end
