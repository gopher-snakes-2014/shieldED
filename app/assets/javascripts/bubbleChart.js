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


        var options = {'title':'Frequency of Reports by Month',
                        width:900,
                        height:500,
                        is3D: true,
                        fontSize: 30,
                        colorAxis: {colors: ['blue', 'red']}}

      var chart = new google.visualization.BubbleChart(document.getElementById('bubble-div'));
      chart.draw(data, options);
      }
    }
