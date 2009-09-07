# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def meta_tag_description
    if @description
      return @description
    else
      return "Hear stories from people who have suffered because of the United States&rsquo; broken health care system."
    end
  end  
end
