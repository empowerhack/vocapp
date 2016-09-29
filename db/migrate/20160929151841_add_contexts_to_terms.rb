class AddContextsToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :context_en, :string
    add_column :terms, :context_ar, :string
    add_column :terms, :term_ar_match, :string
  end
end
