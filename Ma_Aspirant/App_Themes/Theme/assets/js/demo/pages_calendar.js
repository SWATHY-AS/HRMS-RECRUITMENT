//"use strict";$(document).ready(function(){  var b=new Date();var e=b.getDate();var a=b.getMonth();var f=b.getFullYear();var c={};if($("#calendar").width()<=400){c={left:"title",center:"",right:"prev,next"}}else{c={left:"prev,next",center:"title",right:"month,agendaWeek,agendaDay"}}$("#calendar").fullCalendar({disableDragging:false,header:c,editable:true,events:[{title:"All Day Event",start:new Date(f,a,1),backgroundColor:App.getLayoutColorCode("yellow")},{title:"Long Event",start:new Date(f,a,e-5),end:new Date(f,a,e-2),backgroundColor:App.getLayoutColorCode("green")},{title:"Repeating Event",start:new Date(f,a,e-3,16,0),allDay:false,backgroundColor:App.getLayoutColorCode("red")},{title:"Repeating Event",start:new Date(f,a,e+4,16,0),allDay:false,backgroundColor:App.getLayoutColorCode("green")},{title:"Meeting",start:new Date(f,a,e,10,30),allDay:false,},{title:"Lunch",start:new Date(f,a,e,12,0),end:new Date(f,a,e,14,0),backgroundColor:App.getLayoutColorCode("grey"),allDay:false,},{title:"Birthday Party",start:new Date(f,a,e+1,19,0),end:new Date(f,a,e+1,22,30),backgroundColor:App.getLayoutColorCode("purple"),allDay:false,},{title:"Click for Google",start:new Date(f,a,28),end:new Date(f,a,29),backgroundColor:App.getLayoutColorCode("yellow"),url:"http://google.com/",}]})});
$(document).ready(function () {
    var sdate = $("[id$='startdate']").val();
    var edate = $("[id$='enddate']").val();
    //alert(sdate+"-----" + edate);
    var b = new Date();
    var e = b.getDate();  // Current Date 
    var a = b.getMonth();  // Current Month 
    var f = b.getFullYear();  // Current Year 
    //alert(e+"---"+a+"---"+f);
    //var LeaveSdate = sdate.split("/");
    //var LeaveEdate = edate.split("/");
    //alert(getDate());
    //alert(LeaveSdate[2].split(" ")[0]);
    //var e = LeaveSdate[1];  // Date
    //var ee = (LeaveEdate[1] - LeaveSdate[1])+1;
    //var a = Number(LeaveSdate[0])-1;  // Month
    //alert(a + "---" + ee);
    //alert(Number(e) + ee);
    //var f = LeaveSdate[2].split(" ")[0];  // Year
    var c = {};
    if ($("#calendar").width() <= 100)
    {
        c = { left: "title", center: "", right: "prev,next" }
    }
    else
    {
        c = { left: "prev,next", center: "title", right: "month,agendaWeek,agendaDay" }
    }
    //alert(Number(e));
    //alert(Number(e) + ee);
    // it is display data..
    $("#calendar").fullCalendar({
        //disableDragging: false, header: c, editable: false, events: [{ title: "", start: new Date(f, a, e), end: new Date(f, a, Number(e) + 2), backgroundColor: App.getLayoutColorCode("red"), allDay: true, }] 
    })
   
    //alert(document.getElementById(<%=startdate.ClientID %>));

      // $(document).ready(function () { alert('dfghfhfh');  });
      //$(document).ready(function () { alert('sdfsdfsd'); var b = new Date(); var e = b.getDate(); var a = b.getMonth(); var f = b.getFullYear(); var c = {}; if ($("#calendar").width() <= 100) { c = { left: "title", center: "", right: "prev,next" } } else { c = { left: "prev,next", center: "title", right: "month,agendaWeek,agendaDay" } } $("#calendar").fullCalendar({ disableDragging: false, header: c, editable: true, events: [{ title: "Leave", start: new Date(f, a, e + 1, 19, 0), end: new Date(f, a, e + 1, 22, 30), backgroundColor: App.getLayoutColorCode("purple"), allDay: false, }] }) });
});