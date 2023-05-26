divert(-1)
/* vim: set syntax=javascript: */
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
divert(0)

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
         var itemDate = new Date( $(item).find('pubDate').text() );

         $('.iwz-mastodon-feed-toots', feedElement).append(
            '<div class="iwz-mastodon-toot">' +
            'iwz_profile_pic( 64 )' +
            '<div class="iwz-mastodon-toot-date"><a href="' +
               $(item).find('link').first().text() + '">' +
               itemDate.toLocaleString() + '</a></div>' +
            $(item).find('description').text() + '</div>' );
      } );

      $(feedElement).animate( { 'opacity': 1 } );
   } );
} );

