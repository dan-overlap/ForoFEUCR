# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener "turbolinks:load", 
	-> $( "#event_start_date, #event_ending_date" ).datepicker 
		dateFormat: 'yy-mm-dd'