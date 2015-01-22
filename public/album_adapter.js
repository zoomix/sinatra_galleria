var albums = {}

var Album = function(albumName, thumbSize, urls) {
  var self = this;
  self.albumName = albumName;
  self.thumbSize = thumbSize;
  self.urls = urls;
  self.expanded = false;
  self.slides = [];

  self.renderAlbum = function() {
    var nofImagesOnFirstLine = Math.floor($(window).width() / thumbSize);
    nofImagesOnFirstLine += 1;

    var htmlz = self.getAlbumHtml(nofImagesOnFirstLine, self.expanded);
    self.createSlides();

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
        htmlz += "<a class='" + albumName + "' href='" + urls[i]['src'] + "'>";
        if(fullyVisible || i < nofImagesOnFirstLine) {
          htmlz += "<img src='" + urls[i]['msrc'] + "' alt='" + albumName + "'>";
        }
        htmlz += "</a>";
      }
    }
    return htmlz;
  };

  self.createSlides = function() {
    for (var i = 0; i < urls.length; i++) {
      var imgurl = urls[i];
      self.slides.push( imgurl ) 
      self.slides.push( imgurl ) 
    };
  }

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