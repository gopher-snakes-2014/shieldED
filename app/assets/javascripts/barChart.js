google.setOnLoadCallback(drawChart);

  function drawChart() {

      $.ajax({
        url: '/admins/dashboard/pie',
        }).done(function(serverData) {
          fillPieChart(serverData);
      });

      fillPieChart = function(serverData) {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Type');
        data.addColumn('number', 'Total');
        data.addRows([
          ['Physical', serverData.totals[0]],
          ['Verbal', serverData.totals[1]],
          ['Rumors', serverData.totals[2]],
          ['Cyberbullying', serverData.totals[3]],
          ['Exclusion', serverData.totals[4]]
        ]);

        var options = {'title':'Reports of Bullying based on Keyword',
                        width:900,
                        height:500,
                        colors: ['#00CCCC','#669933', '#66FF66', '#339999', '#99CCCC' ],
                        is3D: true,
                        fontSize: 30}

      var chart = new google.visualization.PieChart(document.getElementById('bar-chart'));
      chart.draw(data, options);
      }
    }
