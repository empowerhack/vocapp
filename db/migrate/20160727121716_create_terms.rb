class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :term_en
      t.string :term_ar
      t.string :ac_field_en
      t.string :ac_field_ar
      t.string :definition_en
      t.string :definition_ar
      t.string :context_en
      t.string :context_ar

      t.timestamps null: false
    end
  end
end
