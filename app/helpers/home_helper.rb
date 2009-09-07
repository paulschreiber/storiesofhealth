module HomeHelper
  
  def permalink(story)
     url_for(:controller => :home, :action => :video, :id => story.id, :host => request.host)
  end
  
  def compute_tag_sentence(story)
    tag_list = []
    
    if story.nil?
      all_tags = Tag.find_by_sql("SELECT * FROM tags ORDER BY RAND() LIMIT 5")
      klass = nil
    else
      all_tags = story.tags
      klass = "tag"
    end
    
    all_tags.each do |t|      
      tag_list << link_to(t.description_phrase, {:action => :tag, :id => t.name}, :class => klass) 
    end
    @tag_sentence = tag_list.to_sentence(:last_word_connector => " and ")
    
    if tag_list.size == 1
      @join_phrase = " and"
    else
      @join_phrase = ","
    end
  end
end
