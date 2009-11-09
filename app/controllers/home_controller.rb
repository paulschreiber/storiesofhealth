class HomeController < ApplicationController  
  include HomeHelper
  
  def index(story_count=2)
    @stories = Story.find_by_sql("SELECT * FROM stories WHERE youtube_id IS NOT NULL ORDER BY RAND() LIMIT #{story_count}")
    @story = @stories.first
    @selected_stories = @stories[0..story_count]
    @subtitle = "Every face has a story"
  end
  
  def trailers
    @subtitle = "Trailers"
    @trailer_list = trailer_list
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
  
  def stories
    @stories = Story.find(:all, :conditions => "youtube_id IS NOT NULL", :order => "first_name")
    @subtitle = "Every face has a story"
    render :action => "list" and return
  end
  
  def v
    redirect_to :action => :video
  end
  
  def video
    if params[:id].nil?
      redirect_to :action => :stories
    end 

    @stories = Story.find(:all, :conditions => "youtube_id IS NOT NULL", :order => "first_name")
    @story = Story.find(:first, :conditions => ["youtube_id IS NOT NULL AND id = ?", params[:id]])
    @story = @stories.first if @story.nil?
    @subtitle = "#{@story.first_name}&rsquo;s story"
    @description = @story.description
    
    @browser = true
  end
 
  def from
    @stories = Story.find(:all, :conditions => ["youtube_id IS NOT NULL AND (REPLACE(city, ' ', '') = ? OR city = ?)", params[:id], params[:id]], :order => "first_name")
    @description = "Hear health care stories from people in #{@stories.first.city}, #{@stories.first.state}."
    return specified
  end
  
  def tag
    @tag = Tag.find(:all, :conditions => ["tags.name = ?", params[:id]])
    if @tag.empty?
      redirect_to :action => :index and return
    end
    
    @stories = Story.find(:all, :conditions => ["youtube_id IS NOT NULL AND tags.name = ?", params[:id]], :include => "tags", :order => "first_name")
    @description = "Hear health care stories from people who #{@tag.first.description_phrase}."
    return specified
  end

  def specified
    @stories = Story.all if @stories.empty? 
    @story = @stories.first
    @subtitle = "#{@story.first_name}&rsquo;s story"
    
    @browser = true
    render :action => "video"
  end
  
  # AJAX thumbnail loader
  def browser
    if params[:q] == "tag"
      @stories = Story.find(:all, :conditions => ["youtube_id IS NOT NULL AND tags.name = ?", params[:id]], :include => "tags", :order => "first_name")
    elsif params[:q] == "from"
      @stories = Story.find(:all, :conditions => ["youtube_id IS NOT NULL AND city = ?", params[:id]], :order => "first_name")
    end

    @stories = Story.all if @stories.empty? 
    render :partial => "browser"
  end
  
  # AJAX story loader
  def fetch_story
    if params[:id].nil?
      @story = Story.find(:first, :conditions => "youtube_id IS NOT NULL")
    else
      @story = Story.find(:first, :conditions => ["youtube_id IS NOT NULL AND id = ?", params[:id]])
    end
    @story = Story.first if @story.nil?
    @subtitle = "#{@story.first_name}&rsquo;s story"

    @browser = false
    render :action => "video", :layout => false, :track => true
  end  
end
