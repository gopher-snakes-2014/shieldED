
  google.setOnLoadCallback(drawChart);

  function drawChart() {
      $.ajax({
        url: '/admins/dashboard/bubbles',
        }).done(function(serverData) {
          fillBubbleChart(serverData);
        }).fail(function(){
          console.log("fail");
      }),


      fillBubbleChart = function(serverData) {
        var data = new google.visualization.arrayToDataTable([
          ['ID', 'Month', 'Type', 'Frequency', 'Offender Recurrence'],
          ['',   250,  900,      serverData.totals_quarter[0],   serverData.offender_stats[0]],
          ['',   500,  900,      serverData.totals_quarter[1],   serverData.offender_stats[1]],
          ['',   750,  900,      serverData.totals_quarter[2],   serverData.offender_stats[2]],
          ['',   1000,  900,      serverData.totals_quarter[3],  serverData.offender_stats[3]],
          ['',   1250,  900,      serverData.totals_quarter[4],  serverData.offender_stats[4]],
          ['',   250,  800,      serverData.totals_quarter[5],   serverData.offender_stats[5]],
          ['',   500,  800,      serverData.totals_quarter[6],   serverData.offender_stats[6]],
          ['',   750,  800,      serverData.totals_quarter[7],   serverData.offender_stats[7]],
          ['',   1000,  800,      serverData.totals_quarter[8],  serverData.offender_stats[8]],
          ['',   1250,  800,      serverData.totals_quarter[9],  serverData.offender_stats[9]],
          ['',   250,  700,      serverData.totals_quarter[10],  serverData.offender_stats[10]],
          ['',   500,  700,      serverData.totals_quarter[11],  serverData.offender_stats[11]],
          ['',   750,  700,      serverData.totals_quarter[12],  serverData.offender_stats[12]],
          ['',   1000,  700,      serverData.totals_quarter[13], serverData.offender_stats[13]],
          ['',   1250,  700,      serverData.totals_quarter[14], serverData.offender_stats[14]],
          ['',   250,  600,      serverData.totals_quarter[15],  serverData.offender_stats[15]],
          ['',   500,  600,      serverData.totals_quarter[16],  serverData.offender_stats[16]],
          ['',   750,  600,      serverData.totals_quarter[17],  serverData.offender_stats[17]],
          ['',   1000,  600,      serverData.totals_quarter[18], serverData.offender_stats[18]],
          ['',   1250,  600,      serverData.totals_quarter[19], serverData.offender_stats[19]],
          ['',   250,  500,      serverData.totals_quarter[20],  serverData.offender_stats[20]],
          ['',   500,  500,      serverData.totals_quarter[21],  serverData.offender_stats[21]],
          ['',   750,  500,      serverData.totals_quarter[22],  serverData.offender_stats[22]],
          ['',   1000,  500,      serverData.totals_quarter[23], serverData.offender_stats[23]],
          ['',   1250,  500,      serverData.totals_quarter[24], serverData.offender_stats[24]],
          ['',   250,  400,      serverData.totals_quarter[25],  serverData.offender_stats[25]],
          ['',   500,  400,      serverData.totals_quarter[26],  serverData.offender_stats[26]],
          ['',   750,  400,      serverData.totals_quarter[27],  serverData.offender_stats[27]],
          ['',   1000,  400,      serverData.totals_quarter[28], serverData.offender_stats[28]],
          ['',   1250,  400,      serverData.totals_quarter[29], serverData.offender_stats[29]],
          ['',   250,  300,      serverData.totals_quarter[30],  serverData.offender_stats[30]],
          ['',   500,  300,      serverData.totals_quarter[31],  serverData.offender_stats[31]],
          ['',   750,  300,      serverData.totals_quarter[32],  serverData.offender_stats[32]],
          ['',   1000,  300,      serverData.totals_quarter[33], serverData.offender_stats[33]],
          ['',   1250,  300,      serverData.totals_quarter[34], serverData.offender_stats[34]],
          ['',   250,  200,      serverData.totals_quarter[35],  serverData.offender_stats[35]],
          ['',   500,  200,      serverData.totals_quarter[36],  serverData.offender_stats[36]],
          ['',   750,  200,      serverData.totals_quarter[37],  serverData.offender_stats[37]],
          ['',   1000,  200,      serverData.totals_quarter[38], serverData.offender_stats[38]],
          ['',   1250,  200,      serverData.totals_quarter[39], serverData.offender_stats[39]],
          ['',   250,  100,      serverData.totals_quarter[40],  serverData.offender_stats[40]],
          ['',   500,  100,      serverData.totals_quarter[41],  serverData.offender_stats[41]],
          ['',   750,  100,      serverData.totals_quarter[42],  serverData.offender_stats[42]],
          ['',   1000,  100,      serverData.totals_quarter[43], serverData.offender_stats[43]],
          ['',   1250,  100,      serverData.totals_quarter[44], serverData.offender_stats[44]],
        ]);

        var options = {'title':'Quarterly Frequency by Month and Proportionate Repeat Offender',
                        width:1000,
                        height:600,
                        is3D: true,
                        fontSize: 15,
                        hAxis: {title: "Month"},
                        yAxis: {title: "Type"},
                        hAxis: { ticks: [ {v:150, f:''},{v:250, f:"June"}, {v:500,f:"July"}, {v:750, f:"Aug"}, {v:1000, f:"Sept"}, {v:1250, f:"Oct"}, {v:1500,f:""} ] },
                        vAxis: { ticks: [{v:0,f:""},{v:100, f:'Physical'},{v:200, f:'Verbal'},{v:300, f:'Racist'},{v:400, f:'Cyberbully'},{v:500, f:'Exclusion'},{v:600, f:'Sexual'},{v:700, f:'Rumors'}, {v:800, f:'Transphobic'}, {v:900, f:'Homophobic'}, {v:990, f:''}]},

                        colorAxis: {colors: ['blue', '#ff0000']},
                        sizeAxis: { maxSize: 30},

                      }

      var chart = new google.visualization.BubbleChart(document.getElementById('bubble-chart'));
      chart.draw(data, options);
      }
    }
