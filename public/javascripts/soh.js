/* Copyright 2009 Stories of Health <http://storiesofhealth.org/>
 * Licensed under a Creative Commons Attribution-Noncommercial 3.0 United States License
 * <http://creativecommons.org/licenses/by-nc/3.0/us/>
 */

var addthis_config = {
     ui_header_color: "#fff",
     ui_header_background: "#51392E"
}

var currentUrl = false;

function loadVideo() {
  window.location = "/video/" + this.id.substr(6);
}

function updateVideo() {
  var videoId = this.id.substr(6);
  var url = "/home/story/" + videoId;
  $.trackAjax("/video/" + videoId);
  $("#video").load(url, false, bindTags);
}

function updateBrowser() {
  var url = "/browser" + $(this).attr("href");
  $.trackAjax($(this).attr("href"));
  $("#browser").load(url, false, bindVideos);
  return false;
}

function bindFrontPageVideos() {
  $('.selected-stories .video-story').each(function(){
    $(this).bind("click", loadVideo);
  });

  $('.video-story-medium').each(function(){
    $(this).bind("click", loadVideo);
  });
}

function bindVideos() {
  $('.items .video-story').each(function(){
    $(this).bind("click", updateVideo);
  });
  initScrollable();
}

function bindTags() {
  addthis.button(".addthis_button", {}, {url: currentUrl})
  $('.tag').each(function(){
    $(this).bind("click", updateBrowser);
  });
}

function initScrollable() {
  var itemCount = $('div.items div').length;
  itemCount = (itemCount < 3) ? itemCount : 3;
  $("div.scrollable").scrollable({
	  size: itemCount,
	  speed: 1200
	});     
	
	// don't call this on the front page or static pages
	if ($("div.scrollable").length) { 
	  $("div.scrollable").scrollable().seekTo(0);
  }
}

$(function() {         
	  bindFrontPageVideos();
		bindVideos();
    bindTags();
}); 

jQuery.ajaxSetup({
  "beforeSend": function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
