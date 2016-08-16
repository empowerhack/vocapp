class RemoveDefinitionArFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :definition_ar, :string
  end
end
