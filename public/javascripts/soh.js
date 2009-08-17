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
  var itemCount = $('div.items div').length;
  itemCount = (itemCount < 3) ? itemCount : 3;
  $("div.scrollable").scrollable({
	  size: itemCount,
	  speed: 1200
	});     
	$("div.scrollable").scrollable().seekTo(0);
}

$(function() {         
	  bindFrontPageVideos();
		bindVideos();
    bindTags();
}); 

jQuery.ajaxSetup({
  "beforeSend": function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});
