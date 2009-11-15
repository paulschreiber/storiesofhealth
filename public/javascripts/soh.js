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
  var url = "/home/fetch_story/" + videoId;
  $.trackAjax("/video/" + videoId);
  $("#video").load(url, false, bindTags);
}

function updateBrowser() {
  var url = "/browser" + $(this).attr("href");
  $.trackAjax($(this).attr("href"));
  $("#browser").load(url, false, bindVideos);
  return false;
}

function bindIndexPageVideos() {
  $('.all-stories .video-story').each(function(){
    $(this).bind("click", loadVideo);
  });
}

function onYouTubePlayerReady(playerId) {
  var ytplayer = $("#yt-player")[0];
  if (ytplayer) {
    ytplayer.cueVideoById(videoId, 0);
    $(ytplayer).bind("click", toggleVideoPlaying);
  }
}

function bindFrontPageVideos() {
  $('.selected-stories .video-story').each(function(){
    $(this).bind("click", loadVideo);
  });

  $('.video-story-medium').each(function(){
    $(this).bind("click", loadVideo);
  });

  var params = { allowScriptAccess: "always" };
  var atts = { id: "yt-player" };
  swfobject.embedSWF("http://www.youtube.com/apiplayer?enablejsapi=1&playerapiid=ytplayer", 
                     "yt-player-wrapper", "400", "300", "8", null, null, params, atts);
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
	}).navigator();
	
	// don't call this on the front page or static pages
	if ($("div.scrollable").length) { 
	  $("div.scrollable").scrollable().seekTo(0);
  }
}

$(function() {         
    bindFrontPageVideos();
    bindIndexPageVideos();
    bindVideos();
    bindTags();
    $("div.action a").track({category: "outgoing"});
}); 

jQuery.ajaxSetup({
  "beforeSend": function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
