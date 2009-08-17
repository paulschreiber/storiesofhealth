class StoriesTags < ActiveRecord::Migration
  def self.up
    create_table "stories_tags", :id => false do |t|
      t.column "story_id", :integer, :null => false
      t.column "tag_id",  :integer, :null => false
    end
  end

  def self.down
    drop_table :stories_tags
  end
end
