var albums = {}

var Album = function(albumName, thumbSize, urls) {
  var self = this;
  self.albumName = albumName;
  self.thumbSize = thumbSize;
  self.urls = urls;
  self.expanded = false;

  self.renderAlbum = function() {
    var nofImagesOnFirstLine = Math.floor($(window).width() / thumbSize);

    var htmlz = self.getAlbumHtml(nofImagesOnFirstLine, self.expanded);

    $('#' + albumName + '_container').html(htmlz);
    $('#' + albumName + '_container').css('height', self.expanded? 'auto' : '');
    //$('\.' + albumName).touchGallery();
    $('\.' + albumName).photoSwipe();

  };

  self.getAlbumHtml = function(nofImagesOnFirstLine, fullyVisible) {
    var htmlz = '';
    for(var i = 0; i < urls.length; i++) {
      if(urls[i]) {
        htmlz += "<a class='" + albumName + "' href='" + urls[i]['image'] + "'>";
        if(fullyVisible || i < nofImagesOnFirstLine) {
          htmlz += "<img src='" + urls[i]['thumb'] + "' alt='" + albumName + "'>";
        }
        htmlz += "</a>";
      }
    }
    // htmlz += "<br style='clear:both' /><div class='toggler' onClick='javascript:toggle(\"" + albumName + "\")'>toggle</div>"
    return htmlz;
  };

  return this;
}

var toggle = function(albumName) {
  var album = albums[albumName];
  album.expanded = !album.expanded;
  album.renderAlbum();
}

var albumResizer = function(albumResizerSeed) {
  $.each(albums, function(album_name) { 
    album = albums[album_name];
    if(!album.expanded) {
      album.renderAlbum()
    }
  } );
}
window.onresize = albumResizer