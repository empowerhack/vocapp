class RemoveContextArFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :context_ar, :string
  end
end
