class AddRefurlToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :ref_url, :string
  end
end
