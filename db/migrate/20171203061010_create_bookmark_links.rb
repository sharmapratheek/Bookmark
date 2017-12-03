class CreateBookmarkLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmark_links do |t|
    	t.integer :bookmark_id 
    	t.integer :link_id
    end
  end
end
