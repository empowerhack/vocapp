class AddContextToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :context_en, :string
    add_column :answers, :context_ar, :string
  end
end
