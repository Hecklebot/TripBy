(() => {
  $(document).ready(function(){
    
    $("#container").simpleCalendar({
        //Defaults options below
        //string of months starting from january
        months: ['january','february','march','april','may','june','july','august','september','october','november','december'],
        days: ['sunday','monday','tuesday','wednesday','thursday','friday','saturday'], //string of days starting from sunday
        minDate : "YYYY-MM-DD",         // minimum date
        maxDate : "YYYY-MM-DD",         // maximum date
        insertEvent: true,              // can insert events
        displayEvent: true,             // display existing event
        fixedStartDay: true,            // Week begin always by monday
        event: [],                      // List of events
        insertCallback : function(){}   // Callback when an event is added to the calendar
    });
      
  });
})();