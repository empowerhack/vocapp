class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|

      t.timestamps null: false
    end
  end
end
