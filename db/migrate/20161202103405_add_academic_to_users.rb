class AddAcademicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :academic, :boolean
  end
end
