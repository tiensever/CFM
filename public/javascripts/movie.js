//
// Giang Nguyen 
// http://xiga.info
// Feb - 2011
//

Movie = function() {
  var initializeObservers = function() {
    // function for Movie drill down
    $('#movie_id').bind('change', function() {
      $.ajax({ url: '/drill_down/movie_associated_cities',
               data: { id: $(this).val() },
               success: function(data) {
                 $('#movie_city_id').html(data);
                 if ($('#movie_id').val() == "") {
                   $.ajax({ url: '/drill_down/movie_associated_places', 
                            data: { id: $('#movie_city_id').val() },
                            success: function(data) {
                              $('#movie_place_id').html(data);
                            }
                          });
                 }
               }
             });
    });

    $('#movie_city_id').bind('change', function() {
      if ($('#movie_city_id').val() == "") {
        $.ajax({ url: '/drill_down/movie_associated_places', 
                 data: { id: $('#movie_city_id').val() },
                 success: function(data) {
                   $('#movie_place_id').html(data);
                 }
               });
      } else {
        window.location = $('#drilldown_url').val() + '?drilldown=movie&movie_id=' + $('#movie_id').val() + '&movie_city_id=' + $('#movie_city_id').val();
      }
    });

    $('#movie_place_id').bind('change', function() {
      window.location = $('#drilldown_url').val() + '?drilldown=movie&movie_id=' + $('#movie_id').val() + '&movie_city_id=' + $('#movie_city_id').val() + '&movie_place_id=' + $('#movie_place_id').val();
    });

    // function for City drill down
    $('#city_id').bind('change', function() {
      $.ajax({ url: '/drill_down/city_associated_places',
               data: { id: $(this).val() },
               success: function(data) {
                 $('#city_place_id').html(data);  
                 if ($('#city_id').val() == "") {
                   $.ajax({ url: '/drill_down/city_associated_movies',
                            data: { id: $('#city_place_id').val() },
                            success: function(data2) {
                              $('#city_movie_id').html(data2);  
                            }
                          });
                 } else {
                   window.location = $('#drilldown_url').val() + '?drilldown=city&city_id=' + $('#city_id').val();
                 }
               }
             });
    });

    $('#city_place_id').bind('change', function() {
      if ($('#city_place_id').val() == "") {
        $.ajax({ url: '/drill_down/city_associated_movies',
                 data: { id: $(this).val() },
                 success: function(data) {
                   $('#city_movie_id').html(data);  
                 }
               });
      } else {
        window.location = $('#drilldown_url').val() + '?drilldown=city&city_id=' + $('#city_id').val() + '&city_place_id=' + $('#city_place_id').val();  
      }
    });

    // function for Place drill down
    $('#place_id').bind('change', function() {
      if ($('#place_id').val() == "") {
        $.ajax({ url: 'place_associated_cities',
                 data: { id: $(this).val() },
                 success: function(data) {
                   $('#place_city_id').html(data);  
                   $.ajax({ url: 'place_associated_movies',
                            data: { id: $('#place_city_id').val() },
                            success: function(data2) {
                              $('#place_movie_id').html(data2);  
                            }
                          });
                 }
               });
      } else {
        window.location = $('#drilldown_url').val() + '?drilldown=place&place_id=' + $('#place_id').val();
      }
    });

    $('#place_city_id').bind('change', function() {
      if ($('#place_city_id').val() == "") {
        $.ajax({ url: 'place_associated_movies',
                 data: { id: $(this).val() },
                 success: function(data) {
                   $('#place_movie_id').html(data);  
                 }
               });
      } else {
        window.location = $('#drilldown_url').val() + '?drilldown=place&place_id=' + $('#place_id').val() + '&place_city_id=' + $('#place_city_id').val();
      }
    });

    $('#place_movie_id').bind('change', function() {
      window.location = $('#drilldown_url').val() + '?drilldown=place&place_id=' + $('#place_id').val() + '&place_city_id=' + $('#place_city_id').val() + '&place_movie_id=' + $('#place_movie_id').val();
    });
  }

  return {
    init: function() {
      initializeObservers();
    }
  }
}();
