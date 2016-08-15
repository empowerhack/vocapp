class AddFieldToTerms < ActiveRecord::Migration
  def change
    add_reference :terms, :field, index: true, foreign_key: true
  end
end
