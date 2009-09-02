class AddStorytellerAttributes < ActiveRecord::Migration
  def self.up
    add_column :stories, :age, :integer
    add_column :stories, :sex, :string

    add_index :stories, :age
    add_index :stories, :sex
  end

  def self.down
    remove_column :stories, :age
    remove_column :stories, :sex
  end
end
