class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :hit_id
      t.string :url
      t.string :status

      t.timestamps
    end
  end
end
