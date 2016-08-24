class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :terms, :term_en, :term
  end
end
