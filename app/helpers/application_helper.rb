# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def meta_tag_description
    if @description
      return @description
    else
      return "Hear stories from people who have suffered because of the United States&rsquo; broken health care system."
    end
  end
  
  def object_tag(youtube_id, autoplay=False)
    link = "http://www.youtube.com/v/#{youtube_id}"
    if RAILS_ENV != "development" and autoplay
      link += "&amp;autoplay=1"
    end
    
    result = "<object class='video' type='application/x-shockwave-flash' data='#{link}'>
  		<param name='movie' value='#{link}'></param>
  	</object>"
  end  
end
