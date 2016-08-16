class AddTermToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :term, index: true, foreign_key: true
  end
end
