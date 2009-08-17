class Tag < ActiveRecord::Base
  has_and_belongs_to_many :stories
  
  def description_phrase
  end
end
