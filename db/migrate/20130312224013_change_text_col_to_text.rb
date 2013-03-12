class ChangeTextColToText < ActiveRecord::Migration
  def up
  	rename_column :speeches, :text, :speech_text
  	change_column :speeches, :speech_text, :text, :limit => 4294967295
  end

  def down
  end
end
