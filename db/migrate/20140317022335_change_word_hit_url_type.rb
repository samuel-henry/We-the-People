class ChangeWordHitUrlType < ActiveRecord::Migration
  def change
    change_column(:words, :url, :text)
	end
end
