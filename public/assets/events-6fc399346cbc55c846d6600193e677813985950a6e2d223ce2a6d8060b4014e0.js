(function() {
  document.addEventListener("turbolinks:load", function() {
    return $("#event_start_date, #event_ending_date").datepicker({
      dateFormat: 'yy-mm-dd'
    });
  });

}).call(this);
