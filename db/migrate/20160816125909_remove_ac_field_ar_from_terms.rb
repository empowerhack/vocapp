class RemoveAcFieldArFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :ac_field_ar, :string
  end
end
