class AddMatchesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :term_ar_match, :string
  end
end
