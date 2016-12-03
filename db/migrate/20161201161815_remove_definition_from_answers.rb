class RemoveDefinitionFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :definition, :string
  end
end
