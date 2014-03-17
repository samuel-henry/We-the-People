class AddAnswerUrlToWords < ActiveRecord::Migration
  def change
    add_column :words, :answer_url, :string
  end
end
