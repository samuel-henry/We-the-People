class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.string :date
      t.string :location
      t.string :speaker
      t.string :text
      t.string :title

      t.timestamps
    end
  end
end
