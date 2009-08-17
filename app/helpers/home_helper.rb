module HomeHelper

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
      pretty_description = t.description
      if t.category == "care"
        pretty_description = "cared for a #{t.description}"
      elsif t.category == "insurance"
        pretty_description = "are covered by #{t.description}"
      elsif t.category == "occupation"
        pretty_description = "are #{t.description}"
      end

      tag_list << link_to(pretty_description, {:action => :tag, :id => t.name}, :class => klass) 
    end
    @tag_sentence = tag_list.to_sentence(:last_word_connector => " and ")
    
    if tag_list.size == 1
      @join_phrase = " and"
    else
      @join_phrase = ","
    end
  end
end
