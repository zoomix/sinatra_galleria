var albums = {}

function showGallery(albumName, imageIndex) {
  (new PhotoSwipe(document.querySelectorAll('.pswp')[0], 
                  PhotoSwipeUI_Default, 
                  albums[albumName].urls, 
                  {index: imageIndex} )
  ).init();
}

var Album = function(albumName, thumbSize, urls) {
  var self = this;
  self.albumName = albumName;
  self.thumbSize = thumbSize;
  self.urls = urls;
  self.expanded = false;

  self.renderAlbum = function() {
    var nofImagesOnFirstLine = Math.floor($(window).width() / thumbSize);
    nofImagesOnFirstLine += 1;

    var htmlz = self.getAlbumHtml(nofImagesOnFirstLine, self.expanded);

    $('#' + albumName + '_container').html(htmlz);
    if(self.expanded) {
      $('#' + albumName + '_container').removeClass('compact');
    } else {
      $('#' + albumName + '_container').addClass('compact');
    }

  };

  self.getAlbumHtml = function(nofImagesOnFirstLine, fullyVisible) {
    var htmlz = '';
    for(var i = 0; i < urls.length; i++) {
      if(urls[i]) {
        htmlz += "<a class='" + albumName + "' href='" + urls[i]['src'] + "' onclick='showGallery(\"" + albumName + "\", " + i + "); return false'>";
        if(fullyVisible || i < nofImagesOnFirstLine) {
          htmlz += "<img src='" + urls[i]['msrc'] + "' alt='" + albumName + "'>";
        }
        htmlz += "</a>";
      }
    }
    return htmlz;
  };

  return this;
}

var Albums = function() {
  var self = this;
  self.page = 0;

  self.moreAlbums = function() {
    self.page += 1;
    $.get('/page?page=' + self.page, function(data) {
      $('#galleria').append(data) }
    );
  };

  return this;
}

var setInfiniteFetcher = function(elementId) {
  $(elementId).waypoint(function(direction) {
    if(direction == 'down') {
      albumKeeper.moreAlbums();
    }
  },  { offset: '100%' });
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