
$(document).ready( function() {
   var feedElement = $('.iwz-mastodon-feed');
   $.get( 'https://mastodon.social/@indigoparadox.rss', function( data ) {
      var channel = $(data).find( 'channel' );

      $(feedElement).addClass( 'iwz-button' );

      $(feedElement).append(
         '<a class="iwz-mastodon-feed-title-link" ' +
            'href="https://mastodon.social/@indigoparadox">' +
         '<h2 class="iwz-mastodon-feed-title">Mastodon Feed: <span class="iwz-mastodon-feed-title-name">' +
            $('title', channel).first().text() + '</span></h2></a>' );

      $(feedElement).append(
         '<div class="iwz-mastodon-feed-toots iwz-inset"></div>');

      // Add each feed item to the element.
      $.each( $('item', channel), function( idx, item ) {
         $('.iwz-mastodon-feed-toots', feedElement).append(
            '<div class="iwz-mastodon-toot">' +
            '<div class="iwz-mastodon-toot-date"><a href="' +
               $(item).find('link').first().text() + '">' +
               $(item).find('pubDate').text() + '</a></div>' +
            $(item).find('description').text() + '</div>' );
      } );
   } );
} );

