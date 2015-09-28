class AddStory < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.column :title, :string, :null => false
      t.column :link, :string, :null => false
      t.column :author_id, :integer, :null => false
      t.timestamps :null => true
    end
  end

  def self.down
    drop_table :stories
  end
end
