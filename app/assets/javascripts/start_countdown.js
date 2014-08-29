$('#countdown').countdown('2014/09/04', function(event) {
    $(this).html(event.strftime('%w weeks %d days <br /> %H:%M:%S'));
  });
