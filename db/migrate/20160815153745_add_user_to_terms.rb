class AddUserToTerms < ActiveRecord::Migration
  def change
    add_reference :terms, :user, index: true, foreign_key: true
  end
end
