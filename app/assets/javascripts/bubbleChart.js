google.setOnLoadCallback(drawChart);

  function drawChart() {

      $.ajax({
        url: '/admins/dashboard/bubbles',
        }).done(function(serverData) {
          fillBubbleChart(serverData);
          console.log("success");
          console.log(serverData);
        }).fail(function(){
          console.log("fail");
      }),


      fillBubbleChart = function(serverData) {
        var data = new google.visualization.arrayToDataTable([
          ['ID', 'Month', 'Type', 'Frequency'],
          ['',   80,  167,      120],
          ['',   79,  136,      130],
          ['',   78,  184,      50],
          ['',   72,  278,      230],
          ['',   81,  200,      210],
          ['',   72,  170,      100],
          ['',   68,  477,      80]
        ]);


        var options = {'title':'Monthly Frequencies by Calendar Year',
                        width:1000,
                        height:500,
                        is3D: true,
                        fontSize: 20,
                        colorAxis: {colors: ['blue', 'red']},
                        hAxis: {title: "Month"},
                        yAxis: {title: "Type"},
                        hAxis: { ticks: [{v:0,f:""},{v:20,f:"Jan"},{v:40, f:"Feb"}, {v:60, f:"March"}, {v:80,f:"April"},{v:100, f:"May"}, {v:120, f:"June"}, {v:140,f:"July"}, {v:160, f:"Aug"}, {v:180, f:"Sept"}, {v:200, f:"Oct"}, {v:220, f:"Nov"}, {v:240, f:"Dec"}, {v:260,f:""} ] },
                        vAxis: { ticks: [0,{v:100, f:'5'},{v:200, f:'10'},{v:300, f:'15'},{v:400, f:'20'},{v:500, f:'15'},{v:600, f:'20'},{v:700, f:'25'}]}
                      }

      var chart = new google.visualization.BubbleChart(document.getElementById('bubble-div'));
      chart.draw(data, options);
      }
    }
