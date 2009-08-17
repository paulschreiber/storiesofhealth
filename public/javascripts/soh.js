var addthis_config = {
     ui_header_color: "#fff",
     ui_header_background: "#51392E"
}

var currentVideoUrl = false;

function loadVideo() {
  var videoId = this.id.substr(6);
  window.location = "/video/" + videoId;
}

function updateVideo() {
  var videoId = this.id.substr(6);
  $("#video").load("/home/story/" + videoId, false, bindTags);
}

function updateBrowser() {
  $("#browser").load("/browser" + $(this).attr("href"), false, bindVideos);
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
  addthis.button(".addthis_button", {}, {url: currentVideoUrl})
  $('.tag').each(function(){
    $(this).bind("click", updateBrowser);
  });
}

function initScrollable() {
  $("div.scrollable").scrollable({
	  size: 3,
	  speed: 1200
	});     
}

$(function() {         
	  bindFrontPageVideos();
		bindVideos();
    bindTags();
    initScrollable();
}); 

jQuery.ajaxSetup({
  "beforeSend": function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
