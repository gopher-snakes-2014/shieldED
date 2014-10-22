google.setOnLoadCallback(drawChart);

  function drawChart() {
      console.log("draw???")
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


        var options = {'title':'Monthly Frequencies by Most Recent Quarter',
                        width:1000,
                        height:500,
                        is3D: true,
                        fontSize: 20,
                        colorAxis: {colors: ['blue', 'red']},
                        hAxis: {title: "Month"},
                        yAxis: {title: "Type"},
                        hAxis: { ticks: [ {v:250, f:"June"}, {v:500,f:"July"}, {v:750, f:"Aug"}, {v:1000, f:"Sept"}, {v:1250, f:"Oct"}, {v:1500,f:""} ] },
                        vAxis: { ticks: [{v:0,f:""},{v:100, f:'Physical'},{v:200, f:'Verbal'},{v:300, f:'Racist'},{v:400, f:'Cyberbully'},{v:500, f:'Exclusion'},{v:600, f:'Sexual'},{v:700, f:'Rumors'}, {v:800, f:'Transphobic'}, {v:900, f:'Homophobic'}]}
                      }

      var chart = new google.visualization.BubbleChart(document.getElementById('bubble-div'));
      chart.draw(data, options);
      }
    }
