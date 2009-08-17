class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
      t.string :description
      t.string :category
      t.timestamps
    end

    add_index :tags, :name
    add_index :tags, :category
  end

  def self.down
    drop_table :tags
  end
end
