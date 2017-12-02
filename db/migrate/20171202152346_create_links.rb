class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
    	t.text :link
    	t.timestamps
    end
  end
end
