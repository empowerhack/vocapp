class RemoveTermArFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :term_ar, :string
  end
end
