// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  // function for Movie drill down
  $('#movie_id').live('change', function() {
    $.ajax({ url: 'movie_associated_cities',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#movie_city_id').html(data);  
               $.ajax({ url: 'movie_associated_places',
                        data: {
                                id: $('#movie_city_id').val()
                              },
                        success: function(data2) {
                          $('#movie_place_id').html(data2);  
                        }
                      });
             }
           });
  });

  $('#movie_city_id').live('change', function() {
    $.ajax({ url: 'movie_associated_places',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#movie_place_id').html(data);  
             }
           });
  });

  // function for City drill down
  $('#city_id').live('change', function() {
    $.ajax({ url: 'city_associated_places',
             data: {
                     id: $(this).val(),
                   },
             success: function(data) {
               $('#city_place_id').html(data);  
               $.ajax({ url: 'city_associated_movies',
                        data: {
                                id: $('#city_place_id').val()
                              },
                        success: function(data2) {
                          $('#city_movie_id').html(data2);  
                        }
                      });
             }
           });
  });

  $('#city_place_id').live('change', function() {
    $.ajax({ url: 'city_associated_movies',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#city_movie_id').html(data);  
             }
           });
  });

  // function for Place drill down
  $('#place_id').live('change', function() {
    $.ajax({ url: 'place_associated_cities',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#place_city_id').html(data);  
               $.ajax({ url: 'place_associated_movies',
                        data: {
                                id: $('#place_city_id').val()
                              },
                        success: function(data2) {
                          $('#place_movie_id').html(data2);  
                        }
                      });
             }
           });
  });

  $('#place_place_id').live('change', function() {
    $.ajax({ url: 'place_associated_movies',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#place_movie_id').html(data);  
             }
           });
  });
})();
