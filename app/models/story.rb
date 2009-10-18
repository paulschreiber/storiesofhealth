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

  def youtube_embed_code
    link = "http://www.youtube.com/v/#{self.youtube_id}"
    if RAILS_ENV != "development"
      link += "&amp;autoplay=1"
    end
    link
  end
  
  def tweet
    coder = HTMLEntities.new
    coder.decode("#{self.description} #hcr #hc09 http://storiesofhealth.org/v/#{self.id}")
  end
  
  def tag_list
    self.tags.collect(&:name).join(" ")
  end
end
