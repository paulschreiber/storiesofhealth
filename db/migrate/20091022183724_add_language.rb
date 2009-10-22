class AddLanguage < ActiveRecord::Migration
  def self.up
    add_column :stories, :language, :string, :default => "en"
    add_index :stories, :language
  end

  def self.down
    remove_column :stories, :language
  end
end
