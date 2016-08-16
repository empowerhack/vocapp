class RemoveAcFieldEnFromTerms < ActiveRecord::Migration
  def change
    remove_column :terms, :ac_field_en, :string
  end
end
