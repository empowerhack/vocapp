class AddDefinitionenToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :definition_en, :string
  end
end
