class HomeController < ApplicationController
  def index
    story_count = 3
    
    @stories = Story.find_by_sql("SELECT * FROM stories ORDER BY RAND() LIMIT #{story_count}")
    @story = @stories.first
    @selected_stories = @stories[1..(story_count+1)]
    @subtitle = "Every face has a story"
  end
  
  def about
    @subtitle = "About"
  end

  def action
    @subtitle = "Take Action"
  end

  def share
    @subtitle = "Share Your Story"
  end
  
  
  def video
    @stories = Story.all
    if params[:id].nil?
      @story = Story.first
    else
      @story = Story.find(:first, :conditions => ["id = ?", params[:id]])
    end
    @story = @stories.first if @story.nil?
    @subtitle = "#{@story.first_name}’s story"
    
    @browser = true
  end
 
  def from
    @stories = Story.find(:all, :conditions => ["REPLACE(city, ' ', '') = ? OR city = ?", params[:id], params[:id]])
    return specified
  end
  
  def tag
    @stories = Story.find(:all, :conditions => ["tags.name = ?", params[:id]], :include => "tags")
    return specified
  end

  def specified
    @stories = Story.all if @stories.empty? 
    @story = @stories.first
    @subtitle = "#{@story.first_name}’s story"
    
    @browser = true
    render :action => "video"
  end
  
  # AJAX thumbnail loader
  def browser
    if params[:q] == "tag"
      @stories = Story.find(:all, :conditions => ["tags.name = ?", params[:id]], :include => "tags")
    elsif params[:q] == "from"
      @stories = Story.find(:all, :conditions => ["city = ?", params[:id]])
    end

    @stories = Story.all if @stories.empty? 
    render :partial => "browser"
  end
  
  # AJAX story loader
  def story
    if params[:id].nil?
      @story = Story.first
    else
      @story = Story.find(:first, :conditions => ["id = ?", params[:id]])
    end
    @story = Story.first if @story.nil?
    @subtitle = "#{@story.first_name}’s story"

    @browser = false
    render :action => "video", :layout => false, :track => true
  end  
end
