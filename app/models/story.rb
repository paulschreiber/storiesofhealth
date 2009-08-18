class Story < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  def image_id
    "#{first_name}-#{id}.jpg".downcase
  end

  def city_tag
    "/from/#{self.city.downcase.gsub(' ', '')}"
  end  
end
