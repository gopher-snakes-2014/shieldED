
  google.setOnLoadCallback(drawChart);

  function drawChart() {
      console.log("draw???")
      $.ajax({
        url: '/admins/dashboard/bubbles',
        }).done(function(serverData) {
          fillBubbleChart(serverData);
          console.log(serverData);
        }).fail(function(){
          console.log("fail");
      }),


      fillBubbleChart = function(serverData) {
        var data = new google.visualization.arrayToDataTable([
          ['ID', 'Month', 'Type', 'Frequency'],
          ['',   250,  900,      serverData.totals_quarter[0]],
          ['',   500,  900,      serverData.totals_quarter[1]],
          ['',   750,  900,      serverData.totals_quarter[2]],
          ['',   1000,  900,      serverData.totals_quarter[3]],
          ['',   1250,  900,      serverData.totals_quarter[4]],
          ['',   250,  800,      serverData.totals_quarter[5]],
          ['',   500,  800,      serverData.totals_quarter[6]],
          ['',   750,  800,      serverData.totals_quarter[7]],
          ['',   1000,  800,      serverData.totals_quarter[8]],
          ['',   1250,  800,      serverData.totals_quarter[9]],
          ['',   250,  700,      serverData.totals_quarter[10]],
          ['',   500,  700,      serverData.totals_quarter[11]],
          ['',   750,  700,      serverData.totals_quarter[12]],
          ['',   1000,  700,      serverData.totals_quarter[13]],
          ['',   1250,  700,      serverData.totals_quarter[14]],
          ['',   250,  600,      serverData.totals_quarter[15]],
          ['',   500,  600,      serverData.totals_quarter[16]],
          ['',   750,  600,      serverData.totals_quarter[17]],
          ['',   1000,  600,      serverData.totals_quarter[18]],
          ['',   1250,  600,      serverData.totals_quarter[19]],
          ['',   250,  500,      serverData.totals_quarter[20]],
          ['',   500,  500,      serverData.totals_quarter[21]],
          ['',   750,  500,      serverData.totals_quarter[22]],
          ['',   1000,  500,      serverData.totals_quarter[23]],
          ['',   1250,  500,      serverData.totals_quarter[24]],
          ['',   250,  400,      serverData.totals_quarter[25]],
          ['',   500,  400,      serverData.totals_quarter[26]],
          ['',   750,  400,      serverData.totals_quarter[27]],
          ['',   1000,  400,      serverData.totals_quarter[28]],
          ['',   1250,  400,      serverData.totals_quarter[29]],
          ['',   250,  300,      serverData.totals_quarter[30]],
          ['',   500,  300,      serverData.totals_quarter[31]],
          ['',   750,  300,      serverData.totals_quarter[32]],
          ['',   1000,  300,      serverData.totals_quarter[33]],
          ['',   1250,  300,      serverData.totals_quarter[34]],
          ['',   250,  200,      serverData.totals_quarter[35]],
          ['',   500,  200,      serverData.totals_quarter[36]],
          ['',   750,  200,      serverData.totals_quarter[37]],
          ['',   1000,  200,      serverData.totals_quarter[38]],
          ['',   1250,  200,      serverData.totals_quarter[39]],
          ['',   250,  100,      serverData.totals_quarter[40]],
          ['',   500,  100,      serverData.totals_quarter[41]],
          ['',   750,  100,      serverData.totals_quarter[42]],
          ['',   1000,  100,      serverData.totals_quarter[43]],
          ['',   1250,  100,      serverData.totals_quarter[44]],
        ]);
        // data.addColumn({type: 'string', role: 'tooltip'});

        var options = {'title':'Quarterly Frequency by Month',
                        width:1000,
                        height:550,
                        is3D: true,
                        fontSize: 15,
                        hAxis: {title: "Month"},
                        yAxis: {title: "Type"},
                        hAxis: { ticks: [ {v:150, f:''},{v:250, f:"June"}, {v:500,f:"July"}, {v:750, f:"Aug"}, {v:1000, f:"Sept"}, {v:1250, f:"Oct"}, {v:1500,f:""} ] },
                        vAxis: { ticks: [{v:0,f:""},{v:100, f:'Physical'},{v:200, f:'Verbal'},{v:300, f:'Racist'},{v:400, f:'Cyberbully'},{v:500, f:'Exclusion'},{v:600, f:'Sexual'},{v:700, f:'Rumors'}, {v:800, f:'Transphobic'}, {v:900, f:'Homophobic'}, {v:990, f:''}]},

                        colorAxis: {colors: ['#afc0ed', '#ff0000']},

                      }

      var chart = new google.visualization.BubbleChart(document.getElementById('bubble-div'));
      chart.draw(data, options);
      }
    }
