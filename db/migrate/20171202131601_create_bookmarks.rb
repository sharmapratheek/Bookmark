class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
    	t.string :Bookmarkname
    	t.text :link
    	t.timestamp
    end
  end
end
