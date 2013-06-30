var albums = {}

var Album = function(albumName, thumbSize, urls) {
  var self = this;
  self.albumName = albumName;
  self.thumbSize = thumbSize;
  self.urls = urls;
  self.expanded = false;

  self.renderAlbum = function() {
    var htmlz = self.getAlbumHtml(self.expanded);
    album.inner_cont().html(htmlz);
    album.inner_cont().css('width', (album.urls.length * album.thumbSize)+'px' );
    $('\.' + albumName).photoSwipe();
    $('\.' + albumName + ' img').lazyload({container: self.outer_cont() });
  };

  self.getAlbumHtml = function(fullyVisible) {
    var htmlz = '';
    for(var i = 0; i < urls.length; i++) {
      if(urls[i]) {
        htmlz += "<a class='" + albumName + "' href='" + urls[i]['image'] + "'>";
        htmlz += "<img width='" + self.thumbSize + "' height='" + self.thumbSize + "' src='css/images/overlay.png' data-original='" + urls[i]['thumb'] + "' alt='" + albumName + "'>";
        htmlz += "</a>";
      }
    }
    return htmlz;
  };

  self.outer_cont = function() {
    return $('#' + self.albumName + '_container');
  };
  self.inner_cont = function() {
    return $('#' + self.albumName + '_inner');
  };

  return this;
}

var toggle = function(albumName) {
  var album = albums[albumName];
  album.expanded = !album.expanded;
  if(album.expanded) {
    album.outer_cont().css('overflow', 'scroll');
  } else {
    album.outer_cont().css('overflow', 'hidden');
  }
}

// var albumResizer = function(albumResizerSeed) {
//   $.each(albums, function(album_name) { 
//     album = albums[album_name];
//     if(!album.expanded) {
//       album.renderAlbum()
//     }
//   } );
// }
// window.onresize = albumResizer