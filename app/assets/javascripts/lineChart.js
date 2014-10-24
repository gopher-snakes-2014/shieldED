google.setOnLoadCallback(drawChart);

  function drawChart() {
    console.log("draw it")
      $.ajax({
        url: '/admins/dashboard/lines',
        }).done(function(serverData) {
          fillLineChart(serverData);
      });

      fillLineChart = function(serverData) {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Month');
        data.addColumn('number', 'Total');
        data.addRows([
          ['June', serverData.totals[0]],
          ['July', serverData.totals[1]],
          ['August', serverData.totals[2]],
          ['September', serverData.totals[3]],
          ['October', serverData.totals[4]]
        ]);

        var options = {'title':'Quarter Totals',
                        width:900,
                        height:500,
                        colors: ['#00CCCC','#669933' ],
                        is3D: true,
                        fontSize: 20,
                        curveType: 'function'}

      var chart = new google.visualization.LineChart(document.getElementById('line-chart'));
      chart.draw(data, options);
      }
    }
