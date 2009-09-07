class Tag < ActiveRecord::Base
  has_and_belongs_to_many :stories
  
  def description_phrase
    d = self.description
    if self.category == "care"
      d = "cared for a #{self.description}"
    elsif self.category == "insurance"
      d = "are covered by #{self.description}"
    elsif self.category == "occupation"
      d = "are #{self.description}"
    end
    
    return d
  end
end
