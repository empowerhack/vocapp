class RemoveDefinitionEnFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :definition_en, :string
  end
end
