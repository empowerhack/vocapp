class AddAnswerIdToFlags < ActiveRecord::Migration
  def change
    add_reference :flags, :answer, index: true, foreign_key: true
  end
end
