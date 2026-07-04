

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
            '<div class="iwz-icon-profile iwz-icon-profile-64 "> <div class="iwz-icon-profile-nocollapse-top"></div> <div class="iwz-icon-profile-hair"> <div class="iwz-icon-profile-face"> <div class="iwz-icon-profile-eyes"> <div class="iwz-icon-profile-eyebrow iwz-icon-profile-brow-left"></div> <div class="iwz-icon-profile-eye iwz-icon-profile-eye-left"> <div class="iwz-icon-profile-eye-iris"> <div class="iwz-icon-profile-eye-pupil"></div> </div> </div> <div class="iwz-icon-profile-eyebrow iwz-icon-profile-brow-right"></div> <div class="iwz-icon-profile-eye iwz-icon-profile-eye-right"> <div class="iwz-icon-profile-eye-iris"> <div class="iwz-icon-profile-eye-pupil"></div> </div> </div> </div> </div> <div class="iwz-icon-profile-collar iwz-icon-profile-cllrleft"></div> <div class="iwz-icon-profile-collar iwz-icon-profile-cllright"></div> <div class="iwz-icon-profile-neck"></div> </div> <div class="iwz-icon-profile-shoulders"> <div class="iwz-icon-profile-arms"> <div class="iwz-icon-profile-necktie"></div> <div class="iwz-icon-profile-pocket"></div> </div> </div> </div>' +
            '<div class="iwz-mastodon-toot-date"><a href="' +
               $(item).find('link').first().text() + '">' +
               itemDate.toLocaleString() + '</a></div>' +
            $(item).find('description').text() + '</div>' );
      } );

      $(feedElement).animate( { 'opacity': 1 } );
   } );
} );

