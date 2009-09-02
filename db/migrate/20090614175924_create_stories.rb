class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.integer :congressional_district
      t.string :youtube_id
      t.timestamps
    end

    add_index :stories, :first_name
    add_index :stories, :last_name
    add_index :stories, :city
    add_index :stories, :state
    add_index :stories, :congressional_district
    add_index :stories, :youtube_id
  end

  def self.down
    drop_table :stories
  end
end
