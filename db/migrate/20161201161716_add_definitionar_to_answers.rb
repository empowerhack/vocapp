class AddDefinitionarToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :definition_ar, :string
  end
end
