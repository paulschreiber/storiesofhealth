class Story < ActiveRecord::Base
  has_and_belongs_to_many :tags
  
  def image_id
    "#{first_name}-#{id}.jpg".downcase
  end

  def city_tag
    "/from/#{self.city.downcase.gsub(' ', '')}"
  end  
  
  def youtube_link
    "http://youtube.com/watch?v=#{self.youtube_id}"
  end
  
  def tweet
    "#{self.description} #hcr #hc09 http://storiesofhealth.org/video/#{self.id}"
  end
end
