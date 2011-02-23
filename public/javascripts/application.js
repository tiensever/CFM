// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $('#movie_id').live('change', function() {
    $.ajax({ url: 'associated_cities',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#city_id').html(data);  
               $.ajax({ url: 'associated_places',
                        data: {
                                id: $('#city_id').val()
                              },
                        success: function(data) {
                          $('#place_id').html(data);  
                        }
                      });
             }
           });
  });

  $('#city_id').live('change', function() {
    $.ajax({ url: 'associated_places',
             data: {
                     id: $(this).val()
                   },
             success: function(data) {
               $('#place_id').html(data);  
             }
           });
  });
})();
